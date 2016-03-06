---
title: "Documentation"
output: html_document
---
  
Welcome to the "Wine Finder" app, that has been developed for the Developing Data Products course from Coursera.
This app helps a user select a wine, using data collected from a leading wine source for ratings and reviews.


The user must select a wine type, region, and price range, and then hit "Submit". 
This information is used to make two calculates:
  
1. An average price of the selected wine type in the selected region 
2. The average points of the selected wine type in the selected region within the selected price range

**Important Note**: If either of the calculations render "No Matches", please select different criteria.

It also provides a table of wines filtered by the user's selected criteria. 
The variables included in this table:

- **varietal** - Wine Type
- **title** - Brand Name
- **excerpt** - Brief Description of wine 
- **points** - Wine Spectator 100-Point Scale
- **price** - Price
- **location** - Vineyard Location
- **region** - Locations grouped into broader regions, such as country

The table can be sorted according to any variable by clicking the arrows at the top of the table.  

Source code for ui.R and server.R files are available on my [GitHub](https://github.com/abeasock/Developing_Data_Products-Coursera)