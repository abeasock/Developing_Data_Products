library(shiny)
library(dplyr)
library(BH)


# Read in data
wine <- na.omit(read.csv("wine_reviews.csv")) #Read in data & remove NAs

varietal <- table(wine$varietal)
region <- table(wine$region)

shinyUI(fluidPage(
  titlePanel("Wine Finder"),
  sidebarPanel(
    selectInput("varietal", "Wine Type", names(varietal)),
    selectInput("region", "Region", names(region)),
    sliderInput("price", "Price", min = 1, max = 500, value = c(50,200)),
    submitButton('Submit')
  ),
  
  mainPanel(
    h3('You selected'),
    h5('Type'),
    verbatimTextOutput("otype"),
    h5('Location'),
    verbatimTextOutput("oregion"),
    h5('Price Range'),
    verbatimTextOutput("oprice"),
    h5('Average price of selected wine type by selected region'),
    verbatimTextOutput("avg_price"),
    h5('Average points of selected wine type by selected region within selected price range'),
    verbatimTextOutput("avg_pts"),    
    #textOutput("average"),
    HTML('<br>')
  ),
  fluidRow(
    h3('Results'),
    dataTableOutput("table")
    )
))