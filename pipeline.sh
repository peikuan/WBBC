bwa=bwa
samtools=samtools1.7/bin/samtools
java=java/jre1.8.0_161/bin/java
gatk4=gatk/gatk4
SnpSift=SnpSift.jar

reference=Homo_sapiens_assembly38.fasta
dbsnp=Homo_sapiens_assembly38.dbsnp138.vcf
Mills=Mills_and_1000G_gold_standard.indels.hg38.vcf
phase1=Homo_sapiens_assembly38.known_indels.vcf
chrRegion=hg38chrRegion.bed
Axiom=Axiom_Exome_Plus.genotypes.all_populations.poly.hg38.vcf
hapmap=hapmap_3.3.hg38.vcf
omni=1000G_omni2.5.hg38.vcf
phase=1000G_phase1.snps.high_confidence.hg38.vcf


sample=hn0001
# fastq files to bam files
$bwa mem \
        -t 8 -M -R "@RG\tID:$sample\tSM:$sample\tLB:L8\tPU:$sample\tPL:ILLUMINA\tCN:Lab" \
        $reference \
        $sample\_L1_1.clean.fq.gz \
        $sample\_L1_2.clean.fq.gz \
        |$samtools view \
        -b -S -t $reference.fai \
        -> $sample\_L1.unsorted.A.bam

$bwa mem \
        -t 8 -M -R "@RG\tID:$sample\tSM:$sample\tLB:L8\tPU:$sample\tPL:ILLUMINA\tCN:Lab" \
        $reference \
        $sample\_L2_1.clean.fq.gz \
        $sample\_L2_2.clean.fq.gz \
        |$samtools view \
        -b -S -t $reference.fai \
        -> $sample\_L2.unsorted.A.bam

# merge and sort bam files
$java \
        -Xmx50g -jar $gatk4 MergeSamFiles \
        -I $sample\_L1.unsorted.A.bam \
        -I $sample\_L2.unsorted.A.bam \
        -O $sample.merged.A.bam \
        --CREATE_INDEX true \
        --SORT_ORDER coordinate \
        --VALIDATION_STRINGENCY SILENT \
        --TMP_DIR ./

#  Mark duplicates reads
$java \
        -Xmx50g -jar $gatk4 MarkDuplicates \
        -I $sample.merged.A.bam \
        -O $sample.merged.markdup.A.bam \
        -M $sample.merged.markdup.A.metrics \
        --OPTICAL_DUPLICATE_PIXEL_DISTANCE 2500 \
        --ASSUME_SORTED true \
        --CREATE_INDEX true \
        --MAX_RECORDS_IN_RAM 8000000 \
        --REMOVE_DUPLICATES false \
        --VALIDATION_STRINGENCY SILENT \
        --TMP_DIR ./

# Base quality score recalibration (BQSR)
$java \
        -Xmx50g -jar $gatk4 BaseRecalibrator \
        -I $sample.merged.markdup.A.bam \
        -O $sample.merged.markdup.A.grp \
        -R $reference \
        --known-sites $dbsnp \
        --known-sites $phase1 \
        --known-sites $Mills \
        --tmp-dir ./

$java \
        -Xmx50g -jar $gatk4 ApplyBQSR \
        -I $sample.merged.markdup.A.bam \
        -O $sample.bam \
        -R $reference \
        -bqsr $sample.merged.markdup.A.grp \
        --static-quantized-quals 10 \
        --static-quantized-quals 20 \
        --static-quantized-quals 30 \
        --add-output-sam-program-record \
        --use-original-qualities \
        --create-output-bam-index true \
        --create-output-bam-md5 true \
        --tmp-dir ./

$samtools view -C \
        -T $reference \
        -@8 \
        $sample.bam \
        -o $sample.cram

md5sum $sample.cram >$sample.cram.md5

rm -rf $sample.*.A.*

#Call germline SNPs and indels
$java \
        -Xmx50g -jar $gatk4 HaplotypeCaller \
        -I $sample.bam \
        -O $sample.g.vcf.gz \
        -R $reference \
        -D $dbsnp \
        -ERC GVCF \
        -L $chrRegion \
        -RF OverclippedReadFilter \
       --dont-use-soft-clipped-bases \
       --dont-require-soft-clips-both-ends \
       --filter-too-short 50 \
        -ip 500 \
        -mbq 10 \
        --max-alternate-alleles 3 \
        --min-pruning 3 \
        --native-pair-hmm-threads 12

######################################

chr=chr1
gvcf=gvcf.list
$java \
        -Xmx50g -jar $gatk4 GenomicsDBImport \
        -R $reference \
        -L $bed \
        -ip 500 \
        --batch-size 50 \
        --genomicsdb-workspace-path $chr\_genomicsdb \
        --reader-threads 4 \
        --sample-name-map $gvcf

#merges gVCFs to create a genotyped VCF
$java \
        -Xmx50g -jar $gatk4 GenotypeGVCFs \
        -R $reference \
        -V gendb://$chr\_genomicsdb \
        -O $chr.output.vcf.gz \
        -D $dbsnp \
        -L $bed \
        -G StandardAnnotation \
        --use-new-qual-calculator \
        --only-output-calls-starting-in-intervals

#Hard filters a VCF based on user defined arguments
$java \
        -Xmx50g -jar $gatk4 VariantFiltration \
        -R $reference \
        -V $chr.output.vcf.gz \
        -O $chr.variant_filtered.vcf.gz \
        --filter-expression "ExcessHet > 54.69" \
        --filter-name "ExcessHet"

$java \
        -Xmx50g -jar $gatk4 MakeSitesOnlyVcf \
        --INPUT $chr.variant_filtered.vcf.gz \
        --OUTPUT $chr.sites_only.variant_filtered.vcf.gz
######################################


$java \
        -Xmx50g -jar $gatk4 GatherVcfsCloud \
        --ignore-safety-checks \
        --gather-type BLOCK \
        --input chr1.sites_only.variant_filtered.vcf.gz \
        --input chr2.sites_only.variant_filtered.vcf.gz \
        --input chr3.sites_only.variant_filtered.vcf.gz \
        --input chr4.sites_only.variant_filtered.vcf.gz \
        --input chr5.sites_only.variant_filtered.vcf.gz \
        --input chr6.sites_only.variant_filtered.vcf.gz \
        --input chr7.sites_only.variant_filtered.vcf.gz \
        --input chr8.sites_only.variant_filtered.vcf.gz \
        --input chr9.sites_only.variant_filtered.vcf.gz \
        --input chr10.sites_only.variant_filtered.vcf.gz \
        --input chr11.sites_only.variant_filtered.vcf.gz \
        --input chr12.sites_only.variant_filtered.vcf.gz \
        --input chr13.sites_only.variant_filtered.vcf.gz \
        --input chr14.sites_only.variant_filtered.vcf.gz \
        --input chr15.sites_only.variant_filtered.vcf.gz \
        --input chr16.sites_only.variant_filtered.vcf.gz \
        --input chr17.sites_only.variant_filtered.vcf.gz \
        --input chr18.sites_only.variant_filtered.vcf.gz \
        --input chr19.sites_only.variant_filtered.vcf.gz \
        --input chr20.sites_only.variant_filtered.vcf.gz \
        --input chr21.sites_only.variant_filtered.vcf.gz \
        --input chr22.sites_only.variant_filtered.vcf.gz \
        --input chrX.sites_only.variant_filtered.vcf.gz \
        --input chrY.sites_only.variant_filtered.vcf.gz \
        --input chrMT.sites_only.variant_filtered.vcf.gz \
        --output all.site_only.vcf.gz

$java \
        -Xmx50g -jar $gatk4 IndexFeatureFile \
        --feature-file all.site_only.vcf.gz

#INDEL: Assigns a well-calibrated probability score called VQSLOD to each variant
$java \
        -Xmx50g -jar $gatk4 VariantRecalibrator \
        -R $reference \
        -V all.site_only.vcf.gz \
        -O all.indels.recal \
        -mode INDEL \
        -trust-all-polymorphic \
        -tranche 100.0 -tranche 99.95 -tranche 99.9 -tranche 99.5 -tranche 99.0 -tranche 98.0 -tranche 97.0 -tranche 96.0 \
        -tranche 95.0 -tranche 94.0 -tranche 93.5 -tranche 93.0 -tranche 92.0 -tranche 91.0 -tranche 90.0 \
        -an FS -an ReadPosRankSum -an MQRankSum -an QD -an SOR -an DP \
        --max-gaussians 4 \
        --rscript-file all.indels.plots.R \
        --tranches-file all.indels.tranches \
        -resource:dbsnp,known=true,training=false,truth=false,prior=2 $dbsnp \
        --resource:axiomPoly,known=false,training=true,truth=false,prior=10 $Axiom \
        -resource:mills,known=false,training=true,truth=true,prior=12 $Mills



#SNP: Assigns a well-calibrated probability score called VQSLOD to each variant
$java \
        -Xmx50g -jar $gatk4 VariantRecalibrator \
        -R $reference \
        -V all.site_only.vcf.gz \
        -O all.snps.recal \
        -mode SNP \
        --trust-all-polymorphic \
        -tranche 100.0 -tranche 99.95 -tranche 99.9 -tranche 99.8 -tranche 99.6 -tranche 99.5 \
        -tranche 99.4 -tranche 99.3 -tranche 99.2 -tranche 99.1 -tranche 99.0 -tranche 98.0 -tranche 97.0 -tranche 90.0 \
        -an QD -an MQRankSum -an ReadPosRankSum -an FS -an MQ -an SOR -an DP \
        --max-gaussians 6 \
        --sample-every-Nth-variant 10 \
        --output-model all.snps.model.report \
        --rscript-file all.snps.plots.R \
        --tranches-file all.snps.tranches \
        -resource:hapmap,known=false,training=true,truth=true,prior=15 $hapmap \
        -resource:omni,known=false,training=true,truth=true,prior=12 $omni \
        -resource:1000G,known=false,training=true,truth=false,prior=10 $phase \
        -resource:dbsnp,known=true,training=false,truth=false,prior=7 $dbsnp



$java \
   -Xmx50g -jar $gatk4 ApplyVQSR \
   -R $reference \
   -V $chr.variant_filtered.vcf.gz \
   -O tmp.indel.recalibrated.$chr.vcf \
   -mode INDEL \
   -truth-sensitivity-filter-level 99.0 \
   --create-output-variant-index true \
   --recal-file all.indels.recal \
   --tranches-file all.indels.tranches


$java \
   -Xmx50g -jar $gatk4 ApplyVQSR \
   -R $reference \
   -V tmp.indel.recalibrated.$chr.vcf \
   -O all.filtered.$chr.vcf \
   -mode SNP \
   -truth-sensitivity-filter-level 99.6 \
   --create-output-variant-index true \
   --recal-file all.snps.recal \
   --tranches-file all.snps.tranches


rm -rf tmp.indel.recalibrated.$chr.vcf


cat all.filtered.$chr.vcf | \
   $java \
   -Xmx50g -jar $SnpSift \
   filter "(na FILTER)|(FILTER = 'PASS')" >WBBC.$chr.PASS.vcf


