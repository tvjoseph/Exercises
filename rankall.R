rankall <- function(outcomes,num){
	data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
	seldata <- data[ , c(2,7,11,17,23)]
	names(seldata) <- c("hospital","state","HA","HF","Pn")
	

	if(outcomes == "heart failure") { z <- 4}
	else if (outcomes == "heart attack"){ z <- 3}
	else if (outcomes == "pneumonia"){ z <- 5}
	else  {stop("Invalid Outcome")}
  
  un <- unique(seldata$state)
  len <- length(un)
  k <- data.frame(hospital = 0,state = 0)

month <- split(seldata,seldata$state)
for(i in 1:len){
	
  J <- month[[i]][c(1,2,z)]
  J[,3] <- as.numeric(J[,3])
  sorted <- J[order(J[,3],J[,1]),]
  newsort <- complete.cases(sorted)
  sorted <- sorted[newsort,]
  le <- length(sorted)
  if(num == "worst"){num <- le}
  else if (num == "best"){num <- 1}
  else {num}	
	##new <- length(sorted)		
	##if(num == "worst"){num <- new}
	##else if (num == "best"){num <- 1}
	##else {num}	
 k[i,] <- data.frame(sorted[num,c(1:2)])
  
}

k


}
