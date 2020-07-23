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

fluidPage(
  
  # App title ----
  titlePanel("Please download & Upload 1. Beers Data 2. Breweries Data 3. Then select a Histogram"),
  
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

