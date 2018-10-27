error <- predicted-y_train  
print(error)
print(mean(error$X22))


rmse_error <- rmse(error$X22)
print(rmse_error)

mae_error<-mae(error$X22)
print(mae_error)



#in percentage:
print("RMSE:") 
print(round(rmse_error,5)*100)
print("MAE")
print(round(mae_error,5)*100)

#error:
r<-(mean(error$X22))
print(round(r,5)*100)



er<-(mean(error$X22)*100)
accurasy<- 100-round(er,8)
print(accurasy)



# Function that returns Root Mean Squared Error
rmse <- function(error)
{
  sqrt(mean(error^2)/( sd(y_train $X22)))
}

# Function that returns Mean Absolute Error
mae <- function(error)
{
  mean(abs(error))
}

