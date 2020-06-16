#' @title GetExampleData
#' @description Get the example data of test package for litte trials
#' @param exampleData  A character,should be one of"ampGene","delGene","GEP","CNAP", "SubPathwayInfo" ,"GoInfo","GoSubPconGene","Jaccardscore","SubPathwaymapdata","CNAlabelresult","CNADEscore"and "CNA2Subpathwayresult".
#' @return data
#' @export


GetExampleData<-function(exampleData){
if(!exists("envData")) {
envData<-initializeCNA2Subpathway()
}
  if (exampleData=="CNAP")
  {
    dataset<- get("CNAP",envir=envData)
    return(dataset)
  }
  if (exampleData=="ampGene")
  {
    dataset<- get("ampGene",envir=envData)
    return(dataset)
  }
  if (exampleData=="delGene")
  {
    dataset<- get("delGene",envir=envData)
    return(dataset)
  }
  if (exampleData=="GEP")
  {
    dataset<- get("GEP",envir=envData)
    return(dataset)
  }
  if (exampleData=="SubPathwayInfo")
  {
    dataset<- get("SubPathwayInfo",envir=envData)
    return(dataset)
  }
  if (exampleData=="GoInfo")
  {
    dataset<- get("GoInfo",envir=envData)
    return(dataset)
  }
  if (exampleData=="GoSubPconGene")
  {
    dataset<- get("GoSubPconGene",envir=envData)
    return(dataset)
  }
  if (exampleData=="Jaccardscore")
  {
    dataset<- get("Jaccardscore",envir=envData)
    return(dataset)
  }
  if (exampleData=="SubPathwaymapdata")
  {
    dataset<- get("SubPathwaymapdata",envir=envData)
    return(dataset)
  }
  if (exampleData=="CNAlabelresult")
  {
    dataset<- get("CNAlabelresult",envir=envData)
    return(dataset)
  }
  if (exampleData=="CNADEscore")
  {
    dataset<- get("CNADEscore",envir=envData)
    return(dataset)
  }
  if (exampleData=="CNA2Subpathwayresult")
  {
    dataset<- get("CNA2Subpathwayresult",envir=envData)
    return(dataset)
  }
}
