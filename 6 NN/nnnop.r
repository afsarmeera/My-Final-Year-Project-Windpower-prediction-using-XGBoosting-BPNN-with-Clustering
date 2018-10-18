library(dplyr)
max = apply(z[1:100,] , 2 , max)
min = apply(z[1:100,], 2 , min)
scaled = as.data.frame(scale(z[1:100,], center = min, scale = max - min))

library(neuralnet)

set.seed(2)
NN = neuralnet(X22 ~ X4+X6+X12+X13+X14+X15+X16+X17+X18 ,scaled, hidden = 3 , linear.output = T,threshold = 0.01 )
plot(NN)

predict_testNN = compute(NN, scaled[1:9])
