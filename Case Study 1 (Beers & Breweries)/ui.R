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
  titlePanel("Hello! Welcome to the Budweiser Cast Study App"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "1. Download to local machine 2. Choose Beers CSV File 3. Explore the Dataset",##1. Let the user read in the data (the Beer Data.) 
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")
      ),
      tags$hr(),
      checkboxInput("header", "Header", TRUE)
    ),
    mainPanel(
      tableOutput("contents")
    )
  )
)
