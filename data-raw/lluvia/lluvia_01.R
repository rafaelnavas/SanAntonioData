# Este codigo fusiona los archivos *.dat de cada pluviómetro


rm(list = ls())
est = "001_14321_Padrepio"
est = "002_14324_Sodero"
est = "003_14325_Gamorel"
est = "004_14326_JorgeSouza"
est = "005_14327_Caputto"
est = "006_14329_Escuela_66_Tropezon"
est = "007_14330_Abuelos"
est = "008_Escuela_16_RepArmenia"

#est = "009_Escuela_69_ColHarriegue"
#est = "010_Escuela_31_Col18Julio"
#est = "011_14323_Invernadero"
#est = "012_Monetta"
#est = "013_Saracho"
#est = "014_14324_Uruguay"


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
    print(min(p3$date))
  }

  if(ncol(p1)==4){
    p2 = data.frame(date = as.POSIXct(paste(p1[,1],p1[,2]),
                                      format="%m/%d/%y %H:%M"),
                    p = as.numeric(p1[,3]) + as.numeric(p1[,4])/100)
    print(paste("OK import:", pfiles[i], "4col"))
    print(min(p3$date))
  }

  p3 = rbind(p3,p2)
  rm(list = "p2")
}

summary(p3)
dim(p3)


p4 = p3[!duplicated(p3$date),]


dim(p4)
summary(p4)
P08 = p4

usethis::use_data(P08, overwrite = TRUE)


usethis::use_r("P01")
