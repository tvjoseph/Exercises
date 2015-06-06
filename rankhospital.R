rankhospital <- function(state,outcomes,num){
	data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
	seldata <- data[ , c(2,7,11,17,23)]
	names(seldata) <- c("Hosp","st","HA","HF","Pn")
	funstate <- unique(seldata$st)
	y <- length(funstate)

	for(i in 1:y){
	if(funstate[i] != state){z <- ("False")}
	else   {T <- ("True")}
	}
	
	if (T == "True"){}
	else   {stop("Invalid state")}

	if(outcomes == "heart attack") { z <- "HA"}
	else if (outcomes == "heart failure"){z <- "HF"}
	else if (outcomes == "pneumonia"){z <- "Pn"}
	else  {stop("Invalid Outcome")}

month <- subset(seldata,seldata$st == state)
month[,z] <- as.numeric(month[,z])
sorted <- month[order(month[,z],month[,"Hosp"]),]
newsorted <- complete.cases(sorted)
sorted <- sorted[newsorted,]

	E <- length(sorted[,z])
	if(num == "worst"){r <- E[1]}
	else if(num == "best"){r <- 1}
	else   {r <- num}
	result <- sorted[r,1]
	result
 


}