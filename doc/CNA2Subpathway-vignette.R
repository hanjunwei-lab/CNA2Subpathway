## ----style, echo=FALSE, results="asis", message=FALSE--------------------
knitr::opts_chunk$set(tidy = FALSE,
                      warning = FALSE,
                      message = FALSE)

## ----eval=TRUE-----------------------------------------------------------
#
require(CNA2Subpathway)
# obtain Copy Number Alteration profile data
CNAP<-GetExampleData("CNAP")
head(CNAP[1:10,1:10])
# obtion amplified genes
ampGene<-GetExampleData("ampGene")
# obtion deleted genes 
delGene<-GetExampleData("delGene")
# Obtin the CNA label
CNAlabelresult<-getCNAlabel(CNAP,ampGene,delGene)
# view first ten genes and ten sample of the label
head(CNAlabelresult[1:10,1:10])

## ------------------------------------------------------------------------
# obtain GEP data
GEP<-GetExampleData("GEP")
# obtain the result of getCNAlabel function
CNAlabelresult<-GetExampleData("CNAlabelresult")
# Calculate the CNA-DEscore
CNADEscore<-getCNADEscore(GEP,CNAlabelresult)
# view first the ten gene CNA-DEscore
head(CNADEscore[1:10,])

## ------------------------------------------------------------------------
# load depend package
require(igraph)
# obtain subpathway data 
SubPathwayInfo<-GetExampleData("SubPathwayInfo")
# obtain biological functions data
GoInfo<-GetExampleData("GoInfo")
# obtain some genes shared by a sub-pathway with biological function
GoSubPconGene<-GetExampleData("GoSubPconGene")
# obtain Jaccardscore shared by a sub-pathway with biological function
Jaccardscore<-GetExampleData("Jaccardscore")
# obtain the result of getDEGscore function
CNADEscore<-GetExampleData("CNADEscore")
# run the IDSubPath function
CNA2Subpathwayresult<-IDSubPath(CNADEscore,nperm=100,Subpathway=SubPathwayInfo,Go=GoInfo,Jaccard=Jaccardscore,Go_SubPath_gene=GoSubPconGene)
# get the result of the IDSubPath function #only show
CNA2Subpathwayresult<-GetExampleData("CNA2Subpathwayresult")
# View subpathway rank by fdr value
head(CNA2Subpathwayresult[order(CNA2Subpathwayresult[,"Fdr"]), ][1:10,])


## ------------------------------------------------------------------------
# load depend package
require(discover)
# input gene
genes <- c("AKT3","AKT1","CALML5","PIK3CA","PIK3R1","CALM1","CALM3","CALML3")
# get the result of the getCNAlabel function
CNAlabelresult<-GetExampleData("CNAlabelresult")
# plot discover 
discover<-plotDiscovermap(genes,CNAlabelresult)
plot(discover)


## ------------------------------------------------------------------------
# load depend package
require(igraph)
# obtain subpathwaymap data
SubPathwaymapdata<-GetExampleData("SubPathwaymapdata")
# plot network graph of the subpathway 04915_13
plotSubPathway("04915_13",SubPathwaymapdata)


