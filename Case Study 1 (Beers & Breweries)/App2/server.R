library(rsconnect)
#App to explore Case Study 1
library(data.table)
library(DT)
library(forcats)
library(ggplot2)
library(haven)
library(Hmisc)
library(plotly)
library(scales)
library(shiny)
library(stringi)
library(dplyr)
library(rsconnect)
library(dplyr)
library(ggplot2)
library(caret)
library(class)
library(GGally)
library(e1071)
library(naivebayes)
library(tidyr)
library(ggpubr)
library(data.table)

Beers = read.csv(file.choose(), header = TRUE)
Breweries = read.csv(file.choose(), header = TRUE)
Beers_Brewery = merge(Beers,Breweries, by.x = "Brewery_id", by.y = "Brew_ID")
Beers_Brewery_Omit = na.omit(Beers_Brewery)


function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    
    if(input$select == "ABV")
    {
      x    <- Beers_Brewery_Omit$ABV
      
      hist(x, col = "#75AADB", border = "white",
           xlab = "ABV (Alcohol by Volume)",
           main = "Histogram of ABV")
    }
    if(input$select == "IBU")
    {
      x    <- Beers_Brewery_Omit$IBU
      
      hist(x, col = "#75AADB", border = "white",
           xlab = "IBU (Bitterness)",
           main = "Histogram of IBU")
    }
  })
  
}