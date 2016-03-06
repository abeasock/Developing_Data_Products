# Coursera - Developing Data Products- Course Project

# ui.R file for the shiny app

# This app was developed to help users select a wine

library(shiny)
library(markdown)

# Read in data & remove NAs
wine <- na.omit(read.csv("wine_reviews.csv")) 

varietal <- table(wine$varietal)
region <- table(wine$region)

shinyUI(fluidPage(
  titlePanel("Wine Finder"),
  sidebarPanel(
    HTML('<p><img src="image.jpg"/></p>'),
    selectInput("varietal", "Wine Type", names(varietal)),
    selectInput("region", "Region", names(region)),
    sliderInput("price", "Price", min = 1, max = 500, value = c(50,200)),
    submitButton('Submit')
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Summary",
                h3('You selected'),
                h5('Type'),
                verbatimTextOutput("otype"),
                h5('Location'),
                verbatimTextOutput("oregion"),
                h5('Price Range'),
                verbatimTextOutput("oprice"),
                HTML('<br>'),
                h3('Results'),
                h5('Average price of selected wine type by selected region'),
                verbatimTextOutput("avg_price"),
                h5('Average points of selected wine type by selected region within selected price range'),
                verbatimTextOutput("avg_pts"),    
                #textOutput("average"),
                HTML('<br>')
              ),
      tabPanel("Table", dataTableOutput("table")),
      tabPanel("Documentation", includeMarkdown("Documentation.md"))
    )
  )
))