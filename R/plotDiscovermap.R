
##' @title plotDiscovermap
##' @description we use copy number variation data to polt discover.
##' @param genes A vector of strings. The user intresting and happened CNA genes symbol.
##' @param CNAmatrix The copy number variation matrix. It takes the from of a binary matrix. Only 0 ang 1 are allowed as values.
##' @return Groupwise test of the discover result
##' @importFrom discover discover.matrix
##' @importFrom discover groupwise.discover.test
##' @export
##' @examples
##' # load depend package
##' require(discover)
##' # input gene
##' genes <- c("AKT3","AKT1","CALML5","PIK3CA","PIK3R1","CALM1","CALM3","CALML3")
##' # get the result of the getCNAlabel function
##' CNAlabelresult<-GetExampleData("CNAlabelresult")
##' # plot discover
##' discover<-plotDiscovermap(genes,CNAlabelresult)
##' plot(discover)



plotDiscovermap <- function(genes,CNAmatrix){
  events <- discover.matrix(CNAmatrix)
  groupwise.discover.test(events[genes, ])
  discoverplot<-events[genes, ]
  return(discoverplot)

}
