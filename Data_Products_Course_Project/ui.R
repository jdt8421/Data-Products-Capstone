#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  # Application title
  titlePanel("Historical Stock Price Data for FAANGs"),
  sidebarLayout(
    sidebarPanel( selectInput("stock", 
                              label = "choose a stock for analysis",
                              choices = c("FB", "AAPL", "AMZN",
                                          "NFLX", "GOOG"), selected = "FB")),
    
    # Show the name of the stock, plot, and log monthly returns
    mainPanel(
      textOutput("StockName"),
      plotOutput("stockPlot"),
      textOutput("stockReturn")
    )
  )
))