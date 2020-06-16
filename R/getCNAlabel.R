
##' @title getCNAlabel
##' @description The function getCNAlabel used to discretize the CNA profile to a binary matrix.
##' @param CNAprofile Copy Number Alteration profile
##' @param ampGene A vector of strings,the gene symbol of amplified genes
##' @param delGene A vector of strings,the gene symbol of deleted genes
##' @return A binary matrix
##' @export
##' @examples
##' # obtain Copy Number Alteration profile data
##' CNAP<-GetExampleData("CNAP")
##' head(CNAP[1:10,1:10])
##' # obtion amplified genes
##' ampGene<-GetExampleData("ampGene")
##' # obtion deleted genes
##' delGene<-GetExampleData("delGene")
##' # Obtin the CNA label.
##' CNAlabelresult<-getCNAlabel(CNAP,ampGene,delGene)
##' # get the result of the getCNAlabel function
##' CNAlabelresult<-GetExampleData("CNAlabelresult")
##' # view first ten genes and ten sample of the label
##' head(CNAlabelresult[1:10,1:10])


getCNAlabel<-function(CNAprofile,ampGene,delGene){
  ###profile： 拷贝数变异谱
  ampProfile<-CNAprofile[ampGene,]
  delProfile<-CNAprofile[delGene,]
  ####扩增gene label
  amplabel<-matrix(nrow=nrow(ampProfile),ncol=ncol(ampProfile))
  for(i in 1:nrow(ampProfile)){
    amp<-as.numeric(ampProfile[i,])
    amp[which(amp>=1)]<-1
    amp[which(amp<=0)]<-0
    amplabel[i,]<-amp
  }
  rownames(amplabel)<-rownames(ampProfile)
  ####缺失gene label
  dellabel<-matrix(nrow=nrow(delProfile),ncol=ncol(delProfile))
  for(i in 1:nrow(delProfile)){
    del<-as.numeric(delProfile[i,])
    del[which(del>=0)]<-0
    del[which(del<=-1)]<-1
    dellabel[i,]<-del
  }
  rownames(dellabel)<-rownames(delProfile)

  CNA.label<-as.matrix(rbind(amplabel,dellabel))
  colnames(CNA.label)<-colnames(CNAprofile)
  ##rownames(CNA.label)<-rownames(CNA.label)
  return(CNA.label)
}

