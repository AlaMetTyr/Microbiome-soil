#load SAMBAR source code
source("sambaR-master/SAMBAR_v1.05.txt")

#load dependencies packages
getpackages(myrepos='http://cran.us.r-project.org')

vcf <- read.vcfR( "populations.snps.vcf", verbose = FALSE )
snps_genlight <- vcfR2genlight(vcf)

#convert genlight to sambar file
genlight2sambar(genlight_object="snps_genlight", do_confirm=TRUE)

#filter data
filterdata(indmiss=0.9,snpmiss=0.5,min_mac=2,dohefilter=FALSE,min_spacing=500,nchroms=NULL,TsTvfilter=NULL)


#population structure
findstructure(Kmax=6,add_legend=TRUE,legend_pos="right",legend_cex=2,pop_order=NULL)

calcdistance(nchroms=NULL)

library(vcfR)


rvfrowSums(vcf)/max(rowSums(vcf)) 
chrom <- create.chromR(name="snps", vcf=vcf)
plot(chrom)
extract.gt(vcf) %>%
  summary()

gt.to.popsum(vcf)