statedata <- split(airquality,airquality$Month)
mylist <- statedata["5"]
mrcomp <- mylist[order(mylist[1]), ]
mrcomp

fert = c(10,20,20,50,10,20,10,50,20)
fert