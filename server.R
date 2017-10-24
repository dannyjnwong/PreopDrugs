#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(xtable)

drugs_server <- read.csv("drug_instructions.csv", stringsAsFactors = FALSE)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$drug_instructions <- renderTable({
    
    tab <- drugs_server %>% filter(Drug %in% input$drug_name)
    
    xtable(tab)
    
  })
  
})
