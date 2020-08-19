

##' @title getCNADEscore
##' @description The function getCNADEscore used calculate the CNA-DEscore.we use Student’s t-test method to compute the gene differentially expressed level between CNA labels. To compare the genes regulated by CNAs at a common level, we convert the t-test p-value of each gene to z-score.
##' @param inexpData Gene Expression profile(GEP)
##' @param CNALabel  The CNA label (the result of function getCNAlabel)
##' @return A matrix of the Student’s t-test result and CNA-DEscore
##' @export
##' @examples
##' # obtain GEP data
##' GEP<-GetExampleData("GEP")
##' # obtain the result of getCNAlabel function
##' CNAlabelresult<-GetExampleData("CNAlabelresult")
##' # Calculate the CNA-DEscore
##' CNADEscore<-getCNADEscore(GEP,CNAlabelresult)
##' # view first the ten gene CNA-DEscore
##' head(CNADEscore[1:10,])

getCNADEscore <- function(inexpData, CNALabel){
  exp_sample<-colnames(inexpData)
  CNA_sample<-colnames(CNALabel)
  consample<-intersect(exp_sample,CNA_sample)
  expdata<-inexpData[,consample]
  classLabel<-CNALabel[,consample]
  Ttest<-matrix(nrow=nrow(expdata),ncol=3)
  rownames(Ttest)<-rownames(expdata)
  colnames(Ttest)<-c("T-score","P-value","CNADEscore")

  for(i in 1:nrow(expdata)){
    if(rownames(expdata)[i]%in%rownames(classLabel)){
      gene<-rownames(expdata)[i]
      Label<-classLabel[gene,]
      m <- length(ind1 <- which(Label == 1))
      n <- length(ind2 <- which(Label == 0))
      expdata1 <- expdata[gene,ind1]
      expdata2 <- expdata[gene,ind2]
      rmean1 <- rowMeans(expdata1)
      rmean2 <- rowMeans(expdata2)
      ss1 <- rowSums((expdata1 - rmean1)^2)
      ss2 <- rowSums((expdata2 - rmean2)^2)
      Tscore <- (m + n - 2)^0.5*(rmean2 - rmean1)/((1/m + 1/n)*(ss1 + ss2))^0.5
      Pvalue <- pt(abs(Tscore),lower.tail=F,df=m+n-2)
      Ttest[gene,1]<-Tscore
      Ttest[gene,2]<-Pvalue
    }else{
      Ttest[i,1]<-0
      Ttest[i,2]<-0.5
    }
    P<-Ttest[i,2]
    Zvalue <- qnorm(P ,mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE)
    Ttest[i,3]<-Zvalue
  }
  return(Ttest)
}
