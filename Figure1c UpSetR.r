library(UpSetR)
input <- c(
"WBBC"=45696726,
"gnomAD"=177759422,
"UK10K"=13193314,
"1000G"=38723972,

"WBBC&gnomAD"=32330692,
"WBBC&UK10K"=11157995,
"WBBC&1000G"=20040776,
"gnomAD&UK10K"=32226414,
"gnomAD&1000G"=56815276,
"UK10K&1000G"=19986590,

"WBBC&gnomAD&UK10K"=10718908,
"WBBC&gnomAD&1000G"=16932046,
"WBBC&UK10K&1000G"=9288782,
"gnomAD&UK10K&1000G"=19133681,
"WBBC&gnomAD&UK10K&1000G"=9202763
)


upset(fromExpression(input),
  sets.x.label = "Number of Variants",
  mainbar.y.label="Intersection Size",
  show.numbers=F,
  mb.ratio=c(0.65,0.35),
  scale.intersections='identity',
  point.size=2,
  line.size=0.8,
  text.scale=c(2,2,2,2,2,2),
  sets.bar.color = c("dodgerblue", "MediumPurple", "darkorange1","seagreen3"),
  order.by = "freq")
