% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getCNAlabel.R
\name{getCNAlabel}
\alias{getCNAlabel}
\title{getCNAlabel}
\usage{
getCNAlabel(CNAprofile, ampGene, delGene)
}
\arguments{
\item{CNAprofile}{Copy Number Alteration profile}

\item{ampGene}{A vector of strings,the gene symbol of amplified genes}

\item{delGene}{A vector of strings,the gene symbol of deleted genes}
}
\value{
A binary matrix
}
\description{
The function getCNAlabel used to discretize the CNA profile to a binary matrix.
}
\examples{
# obtain Copy Number Alteration profile data
CNAP<-GetExampleData("CNAP")
head(CNAP[1:10,1:10])
# obtion amplified genes
ampGene<-GetExampleData("ampGene")
# obtion deleted genes
delGene<-GetExampleData("delGene")
# Obtin the CNA label.
CNAlabelresult<-getCNAlabel(CNAP,ampGene,delGene)
# get the result of the getCNAlabel function
CNAlabelresult<-GetExampleData("CNAlabelresult")
# view first ten genes and ten sample of the label
head(CNAlabelresult[1:10,1:10])
}
