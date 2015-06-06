best <- function(state,outcome){
  
  data <- read.csv("D:/R/outcome-of-care-measures.csv",header = T, sep = ",")  
  funstate <- unique(data$State)
  
  y <- length(funstate)
  
  for (i in 1:y){
    
    if (funstate[i] != state){z <- ("False")}
    else {T <- ("True")}
  }
  
  if ( T == "True"){print("valid state")}
  else {stop("Invalid state")}  
  
  
  
  if(outcome == "heart attack"){ z <- 11}
  else if (outcome == "heart failure"){z <- 17}
  else if (outcome == "pneumonia"){z <- 23}
  else {stop("Invalid Outcome")}
  
  mr = NULL
  mrcomp = NULL
  hosp = NULL
  sort = NULL
  count = NULL
  mylist = NULL
  
  statedata <- split(data,data[[7]])
  mylist <- statedata[[state]]
   
   
  mrcomp <- mylist[order(mylist[z]),]
  
  
  hosp <- mrcomp[1,]
  hosp[2]
  

}