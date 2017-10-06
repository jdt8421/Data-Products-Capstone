#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(PerformanceAnalytics)
library(zoo)
library(shiny)
library(tseries)
library(TTR)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$stockPlot <- renderPlot({
              plot(get.hist.quote(instrument=input$stock, start="1970-01-01", 
                      end="2020-09-30", origin="1970-01-01",
                      quote="AdjClose", provider="yahoo", 
                      compression="m", retclass="zoo"), xlab = "Years", ylab = "Adjusted Close", main = "Historical Stock Chart")
      })
    
  output$StockName = reactive({
    paste("The stock selected is: ",
    if(input$stock == "FB"){"Facebook"}
    else if(input$stock == "AMZN"){"Amazon"}
    else if(input$stock == "AAPL"){"Apple"}
    else if(input$stock == "Netlix"){"Netflix"}
    else {"Google"},
    sep = "")
    })
  
  output$stockReturn = reactive(
    paste("The log monthly return is: ", round(mean(ROC(get.hist.quote(instrument=input$stock, start="1970-01-01", 
                   end="2020-09-30", origin="1970-01-01",
                   quote="AdjClose", provider="yahoo", 
                   compression="m", retclass="zoo")), na.rm=TRUE),3), sep = "")
  )
})