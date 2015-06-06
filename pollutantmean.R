
## Defining the function
pollutantmean <- function(directory,pollutant,id){
 ## Initialising the place holders
  y <- NULL
  Z <- NULL
  means <- NULL
  results <- NULL
  ## Defining the file name of the CSV file based on the counter
  for(i in 1:length(id)){
    if(id[i] < 10 ) {x <- paste0("00")}
    
    else if (id[i] < 100) {x <- paste0("0")}
    
    else {x<-paste0()}
	
    
    ## Defining the column for the pollutant    
    if(pollutant == "sulfate") {p <- 2} else {p <- 3}
    
    ## Creating the vector for storing the file path
    y<- paste0("D:/R/",directory,"/",x,id[i],".csv",sep = "")
    
    ## Creating the dataframe for reading the CSV file and storing the data,from the above vector
    z <- read.csv(y, header = T, sep = ",")
    
    ## Calculating the mean of the defined pollutant
    means <- mean(z[,p], na.rm = T)
    
    ## Storing the mean in another vector
    results[i] <- means
    
  }
  
  ## Displaying the mean of the results vector
 mean(results,na.rm=T)
 
 
 
 

}
