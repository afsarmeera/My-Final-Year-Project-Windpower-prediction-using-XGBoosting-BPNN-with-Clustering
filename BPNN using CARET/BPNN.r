x_train <- c0[1:100,]
y_train <- c0o[1:100,]
x_test <- c0[1:30,]







require(caret)

x <- cbind(x_train,y_train)

# Fitting model

TrainControl <- trainControl( method = "repeatedcv", number = 10, repeats = 4)

model<- train(X22 ~ ., data = x, method = "nnet", trControl = TrainControl,verbose = FALSE)

#OR 

#model<- train(X22 ~ ., data = x, method = "xgbTree", trControl = TrainControl,verbose = FALSE)

predicted <- predict(model, x_test)
