

library(readr)

b <- read_csv("wpf/ME FINAL PROJECT/Dataset/b.csv", 
              col_types = cols_only(X10 = col_guess(),X22 = col_guess() ,
                                    X12 = col_guess(), X13 = col_guess(), 
                                    X14 = col_guess(), X15 = col_guess(), 
                                    X16 = col_guess(), X17 = col_guess(), 
                                    X18 = col_guess(), X4 = col_guess(), 
                                    X6 = col_guess()))

library(h2o)
h2o.init()
prostate.hex<-as.h2o(b)
summary(prostate.hex)
prostate.km = h2o.kmeans(prostate.hex, k = 4, x=c("X4","X6","X10","X12","X13","X14","X15","X16","X17","X18","X22"))
print(prostate.km)

kmeansp<-predict(prostate.km,prostate.hex)
prostate.pred = h2o.predict(object = prostate.km, newdata = prostate.hex)

print(prostate.km)

prostate.data = as.data.frame(prostate.hex)
prostate.clus = as.data.frame(prostate.pred)


prostate.data$clusters<-prostate.clus$predict

write.csv(prostate.data,"kmeansout.csv")
