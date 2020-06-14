random_network<-function(kegg_random){
  adj.final1<-as.matrix(kegg_random)
  graph1 = graph.adjacency(adj.final1,mode=c("undirected"), weighted=TRUE,add.rownames=T)
  temp1 = page.rank(graph1, vids=V(graph1), directed=FALSE, damping=0.90, weights=NULL)
  rank1 = temp1$vector
  rank2 = as.matrix(rank1)
  return(rank2)
}

go_p_score_row<-function(genecount,descore,path_size){
  score_row<-rep(0,path_size)
  for(j in 1:length(genecount)){
    if(genecount[j]!=""){
      gene<-unlist(strsplit(genecount[j], split = ","))
      location<-match(gene,descore[,1])
      de1<-descore[location,2]
      de_score1<-median(as.numeric(de1))
      if (!is.na(de_score1)) {
        score_row[j]<-de_score1
      }
    }
  }
  return(score_row)
}


##' @title IDSubPath
##' @description The function IDSubPath used to find significant dysregulate subpathways by the IDSCNA method.
##' According our method, in this function, the user need input 6 variable. Four of six variable can obtain from our example data, those data from KEGG and GO, and the user can change at will also. The "CNADEscore" variable is result of function getCNADEscore. And the last variable is nperm, that representative number of disturbances, usually nperm = 1000 or bigger as statistically significant.
##' @param CNADEscore The CNA-DEscore of genes.
##' @param nperm input Number of disturbance(>=1000).
##' @param Subpathway Subpathway information from SuupathwayMiner.
##' @param Go  Biological functions data from Gene Ontology.
##' @param Jaccard Jaccard score shared by a sub-pathway with biological function. Used to optimization.
##' @param Go_SubPath_gene Genes symble shared by a sub-pathway with biological function. Used to optimization.
##' @return Optimized subpathway,and the statistical significance p value and FDR for these optimal subpathways
##' @importFrom igraph graph.adjacency
##' @importFrom igraph V
##' @importFrom igraph page.rank
##' @importFrom stats median
##' @importFrom stats p.adjust
##' @importFrom stats pt
##' @importFrom stats qnorm
##' @export
##' @examples
##'
##' # load depend package
##' require(igraph)
##' # obtain subpathway data
##' SubPathwayInfo<-GetExampleData("SubPathwayInfo")
##' # obtain biological functions data
##' GoInfo<-GetExampleData("GoInfo")
##' # obtain some genes shared by a sub-pathway with biological function
##' GoSubPconGene<-GetExampleData("GoSubPconGene")
##' # obtain Jaccardscore shared by a sub-pathway with biological function
##' Jaccardscore<-GetExampleData("Jaccardscore")
##' # obtain the result of getDEGscore function
##' CNADEscore<-GetExampleData("CNADEscore")
##' # run the IDSubPath function
##' #CNA2Subpathwayresult<-IDSubPath(CNADEscore,nperm=100,
##' #                     Subpathway=SubPathwayInfo,Go=GoInfo,
##' #                     Jaccard=Jaccardscore,Go_SubPath_gene=GoSubPconGene)
##' # get the result of the IDSCNA function #only show
##' CNA2Subpathwayresult<-GetExampleData("CNA2Subpathwayresult")
##' # View the result top 10 subpathways
##' head(CNA2Subpathwayresult[1:10,])

IDSubPath <- function(CNADEscore,nperm,
                   Subpathway,Go,Jaccard,Go_SubPath_gene){
  kegg<-cbind(as.character(Subpathway[,"SubPathID"]),as.character(Subpathway[,"Gene"]))
  path_size<-length(kegg[,1])
  go<-as.matrix(Go)
  go_size<-length(go[,"Go_mf"])
  jaccard<-as.matrix(Jaccard)
  go_path_gene<-as.matrix(Go_SubPath_gene)
  DEscore<-cbind(rownames(CNADEscore),abs(CNADEscore[,"CNADEscore"]))
  median_score<-matrix(0,nrow=go_size,ncol=path_size)
  for(k in 1:go_size){
    con_gene<-go_path_gene[k,]
    row<-go_p_score_row(con_gene,DEscore,path_size)
    median_score[k,]<-row
  }
  go_kegg<-median_score*jaccard
  colnames(go_kegg)<-kegg[,1]
  rownames(go_kegg)<-go[,1]
  #######构建subpath-subpath网
  edge<-as.matrix(go_kegg)
  edget<-t(edge)
  kegg_kegg<-edget%*%edge
  #######计算centra,
  adj.final<-as.matrix(kegg_kegg)
  graph = graph.adjacency(adj.final,mode=c("undirected"), weighted=TRUE,add.rownames=T)
  temp = page.rank(graph, vids=V(graph), directed=FALSE, damping=0.90, weights=NULL)
  rank = temp$vector
  rank1 = as.matrix(rank)
  ########扰动网络
  iter<-nperm
  Centrality_Scores<-matrix(nrow=path_size,ncol=iter+1)
  real.centra<-rank1
  Centrality_Scores[,1]<-real.centra
  real.subname<-rownames(real.centra)
  subpathway<-colnames(kegg_kegg)
  for(i in 1:iter){
    per_subpathway<-sample(subpathway,replace = F)
    per_kegg_kegg<-kegg_kegg
    colnames(per_kegg_kegg)<-per_subpathway
    rownames(per_kegg_kegg)<-per_subpathway
    per_centra<-random_network(per_kegg_kegg)
    location<-match(real.subname,per_subpathway)
    per_centra1<-per_centra[location,]
    Centrality_Scores[,i+1]<-per_centra1
  }
  adj = as.matrix(Centrality_Scores)
  perm_rank = adj[,2:(iter+1)]
  orig_rank = adj[,1]
  pval = matrix(data=NA, nrow=path_size, ncol=1)
  for ( j in 1:path_size ) {
    pval[j] = sum(perm_rank[j,] > orig_rank[j])/iter
  }
  ## p_value<-cbind(kegg1[,1],)
  ## colnames(p_value)<-c("subpathway","pvalue")
  p_padjust<-p.adjust(pval,method = "fdr")
  pa<-as.numeric(p_padjust)
  fdr<-round(pa,3)
  allresult<-cbind(Subpathway,pval,fdr)
  colnames(allresult)<-c("SubPathID","Pathway","Size","gene","P-value","Fdr")
  result<-as.data.frame(allresult)
  ###rank
  rankresult<-result[order(result$`P-value`), ]
  rownames(rankresult)<-c(1:dim(kegg)[1])
  return(rankresult)
}
