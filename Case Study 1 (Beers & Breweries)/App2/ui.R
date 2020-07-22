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

#Beers = read.csv(file.choose(), header = TRUE)
#Breweries = read.csv(file.choose(), header = TRUE)
#Beers_Brewery = merge(Beers,Breweries, by.x = "Brewery_id", by.y = "Brew_ID")
#Beers_Brewery_Omit = na.omit(Beers_Brewery)


fluidPage(
  
  # App title ----
  titlePanel("Please select a Histogram"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      #Copy the line below to make a select box 
      selectInput("select", label = h3("ABV (Alcohol by Volume) or IBU (Bitterness)"), 
                  choices = list("ABV" = "ABV", "IBU" = "IBU"), 
                  selected = 1),
      hr(),
      fluidRow(column(3, verbatimTextOutput("value")))
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

