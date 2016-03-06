# Coursera - Developing Data Products- Course Project

# server.R file for the shiny app

# This app was developed to help users select a wine

library(shiny)
library(markdown)

shinyServer(
  function(input, output) {
   
    #Read in data & remove NAs
    wine <- na.omit(read.csv("wine_reviews.csv")) 
    
    output$otype <- renderPrint({input$varietal})
    output$oregion <- renderPrint({input$region})
    output$oprice <- renderPrint({as.character(c(paste(input$price, collapse='-')))})
  
    output$avg_price <- renderText({
      avg_price <- round(mean(wine[wine$varietal == input$varietal & wine$region == input$region,'price']),2)
      
      if (avg_price != 'NaN'){
        paste("Average price of", input$varietal, "from", input$region, "$", avg_price)
      }
      else { 
        paste("No Matches")
      }
    })
    output$table <- renderDataTable({ 
      filter <- subset(wine, varietal == input$varietal & region == input$region & price >= input$price[1] & price <= input$price[2])         
    })
    
   output$avg_pts <- renderText({
      avg_pts <- round(mean(wine[wine$varietal == input$varietal & wine$region == input$region & wine$price >= input$price[1] & wine$price <= input$price[2],'points']),0)
      if (avg_pts != 'NaN'){
        paste("Average points of", input$varietal, "from", input$region, "within the price range of $", input$price[1], "-", input$price[2], "is", avg_pts)
      }
      else { 
        paste("No Matches")
      }
      
  })  
  }
)