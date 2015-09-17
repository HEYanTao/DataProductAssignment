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
            output$mean<-renderPrint({
                  attach(data)
                  if(input$check=="y"){
                         m1<-tapply(get(input$choice),data$am,mean)
                         paste0(" AT cars' mean:",m1[1],"; MT cars' mean:",m1[2])
                  }
                  else{
                        m1<-mean(get(input$choice))
                        paste0(" All cars' mean:",m1)
                  }
            })
                  })
