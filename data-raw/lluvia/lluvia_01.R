rm(list = ls())
est = "001_14321_Padrepio"
est = "002_14324_Sodero"
pfiles = list.files(paste0("./data-raw/lluvia/",est), full.names = T)

p1 = read.table(pfiles[1], sep=",")

if(ncol(p1)==3){
  p3 = data.frame(date = as.POSIXct(paste(p1[,1],p1[,2]),
                                    format="%m/%d/%y %H:%M"),
                  p = as.numeric(p1[,3]))
  print(paste("OK import:", pfiles[1], "3col"))
}

if(ncol(p1)==4){
  p3 = data.frame(date = as.POSIXct(paste(p1[,1],p1[,2]),
                                    format="%m/%d/%y %H:%M"),
                  p = as.numeric(p1[,3]) + as.numeric(p1[,4])/10)
  print(paste("OK import:", pfiles[1], "4col"))
}



for(i in 2:length(pfiles)){
  p1 = read.table(pfiles[i], sep=",")

  if(ncol(p1)==3){
    p2 = data.frame(date = as.POSIXct(paste(p1[,1],p1[,2]),
                                      format="%m/%d/%y %H:%M"),
                    p = as.numeric(p1[,3]))
    print(paste("OK import:", pfiles[i], "3col"))
  }

  if(ncol(p1)==4){
    p2 = data.frame(date = as.POSIXct(paste(p1[,1],p1[,2]),
                                      format="%m/%d/%y %H:%M"),
                    p = as.numeric(p1[,3]) + as.numeric(p1[,4])/10)
    print(paste("OK import:", pfiles[i], "4col"))
  }

  p3 = rbind(p3,p2)
  rm(list = "p2")
}


summary(p3)

