#!/bin/sh


BaseDir='./input'


smc++ plot \
	${BaseDir}/plot_out/chr2_4-Regions_10_part1_pe-0.02_rp-6.55_kt-9.pdf \
	${BaseDir}/estimate_out/pe-0.02_rp-6.55_kt-9/North_10.final.json \
	${BaseDir}/estimate_out/pe-0.02_rp-6.55_kt-9/Central_10.final.json \
	${BaseDir}/estimate_out/pe-0.02_rp-6.55_kt-9/South_10.final.json \
	${BaseDir}/estimate_out/pe-0.02_rp-6.55_kt-9/Lingnan_10.final.json \
	-g 29 \
	-y 10e2 50e4 \
	-x 10e2 10e5


smc++ plot \
	${BaseDir}/plot_out/chr2_4-Regions_10_part2_pe-0.02_rp-6.55_kt-9.pdf \
	${BaseDir}/estimate_out/pe-0.02_rp-6.55_kt-9/North_10.final.json \
	${BaseDir}/estimate_out/pe-0.02_rp-6.55_kt-9/Central_10.final.json \
	${BaseDir}/estimate_out/pe-0.02_rp-6.55_kt-9/South_10.final.json \
	${BaseDir}/estimate_out/pe-0.02_rp-6.55_kt-9/Lingnan_10.final.json \
	-g 29 \
	-y 0 2.5e5 \
	-x 1e3 2e4 \
	--linear

