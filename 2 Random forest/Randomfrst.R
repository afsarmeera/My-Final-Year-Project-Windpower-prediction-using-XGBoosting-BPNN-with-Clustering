

#CLEANING &IMPORTING


library("reader")
a <- read_csv("a.csv")
a<-a[-1,]
#a<-a[-427050,-1]
write.csv(a,"b.csv")
#b <- read_csv("b.csv", col_types = cols(X2 = col_time(format = "%H:%M")))
#b <- read_csv("b.csv", col_types = cols(X1_1 = col_skip()))
#b <- read_csv("b.csv", col_types = cols(X1_1 = col_date(format = "%m/%d/%Y"),  +     X2 = col_time(format = "%H:%M")))
b <- read_csv("b.csv", col_types = cols(X1_1 = col_skip(), 
                                        X2 = col_skip()))                                      


#RANDOM FOREST
library(h2o)

h2o.init(nthreads=-1,max_mem_size = "2G")

h2o.removeAll() 


#f <- as.h2o("b")
f <-h2o.importFile(path = normalizePath("c:/Users/MohamedAfsar/Documents/wpf/b.csv"))

splits <- h2o.splitFrame(f,c(0.6,0.2),seed=1234) 

train <- h2o.assign(splits[[1]], "train.hex")   

valid <- h2o.assign(splits[[2]], "valid.hex")  

f1 <- h2o.randomForest(         ## h2o.randomForest function
  training_frame = train,        ## the H2O frame for training
  validation_frame = valid,      ## the H2O frame for validation (not required)
  x=4:22,                        ## the predictor columns, by column index
  y=23,                          ## the target index (what we are predicting)
  model_id = "rf_covType_v1",    ## name the model in H2O
  ntrees = 200,stopping_rounds = 2,score_each_iteration = T,seed = 1000000)

d<-summary(f1)

s<-as.matrix(d)


write.csv(s,"s.csv")

#GRAPH
library(plotly)
p <- plot_ly(s, x = ~variable, y = ~percentage, type = 'bar', name = 'feature selection')


