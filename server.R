library(shiny)
library(UsingR)
library(ggplot2)
#Data Procedure
data(mtcars)
data<-mtcars
carnames<-row.names(data)
data<-cbind(carnames,data)
data$am<-as.factor(data$am)
levels(data$am)<-c("MT CARS","AT CARS")
#Server
shinyServer(
      function(input,output){
            par(las=3,pch=1)
            output$pic<-renderPlot({
                  if(input$check=="y"){
                        qplot(get(input$choice),carnames,data=data,col=am,xlab="",ylab="")
                        }
                  else{
                        qplot(get(input$choice),carnames,data=data,xlab="",ylab="")
                        }
                  })     
                  })
# plot(data[,1],rep(1,32),type="p",col="white",xlab="",ylab="",main="Distinguish AT and MT")
# points(data[data$am==1,1],data[data$am==1,I(as.numeric(as.character(input$choice)))],type="p",col="blue")
# points(data[data$am==0,1],data[data$am==0,I(as.numeric(as.character(input$choice)))],type="p",col="red")
# legend("topleft",pch=1,col=c("blue","red"),legend=c("MT cars","AT cars"))