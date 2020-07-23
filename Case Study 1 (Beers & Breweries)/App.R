library(rsconnect)
rsconnect::deployApp('C:\Users\Dawson\Documents\GitHub\dawsond-smu.github.io\Simple Website\Case Study 1 (Beers & Breweries)\App.R')
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



## Only run examples in interactive R sessions
if (interactive()) {
  
  ui <- fluidPage(
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

  
  server <- function(input, output) {
    output$contents <- renderTable({
      # input$file1 will be NULL initially. After the user selects
      # and uploads a file, it will be a data frame with 'name',
      # 'size', 'type', and 'datapath' columns. The 'datapath'
      # column will contain the local filenames where the data can
      # be found.
      inFile <- input$file1
      
      if (is.null(inFile))
        return(NULL)
      
      read.csv(inFile$datapath, header = input$header)
    }
    )
  }
  
  shinyApp(ui, server)
}

##2. Let the user make a histogram of the IBU
if (interactive()) {
ui <- fluidPage(
  
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
      selectInput(inputId = "StateFilter", label = ("State Filter"),
                  choices = unique(Beers_Brewery_Omit$State),
                  multiple = TRUE),
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
# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    
    filtered_data <- reactive({
      dplyr::filter(Beers_Brewery_Omit, Beers_Brewery_Omit$State==input$StateFilter)
    })
    
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
shinyApp(ui, server)
}


##4. Low the user switch back and forth between histograms and boxplots to represent this information.  You could do this with a radio button that switches the plot from histogram to boxplot … the implementation however is up to you.  

##5. Allow the user to filter the histograms / boxplots above by state. 

##6. In addition to the histograms, add a scatter plot of IBU v. ABV

##7. Add the ability to add or take off the simple linear regression line. 

##8. Allow the user to filter the data on the scatter plot by state.

##9. Add at least one additional plot from your analysis and make sure to clearly label and/or describe the information it is conveying.  



