initializeCNA2Subpathway<-function(){
   utils::data("envData",package="CNA2Subpathway")
}

Getenvir<-function(envData){

if(!exists("envData")) initializeCNA2Subpathway()
return(get(envData,envir=envData))

}

