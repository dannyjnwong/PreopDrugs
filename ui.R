#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)

drugs_ui <- read.csv("Royal_Cornwall_drugs.csv", stringsAsFactors = FALSE) 

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Preop Medication Advice v0.01"),
  p("Disclaimer: This advice comes from the Royal Cornwall Hospital, used without permission. Seek further advice from your doctor."),
  a(href="https://doclibrary-rcht.cornwall.nhs.uk/DocumentsLibrary/RoyalCornwallHospitalsTrust/Clinical/Anaesthetics/PreOperativeAssessmentGuidelines.pdf", "Click here for the original guidelines upon which this advice is based."),
  p("MIT License; Copyright (c) 2017 Danny Jon Nian Wong."), 
  a(href="https://github.com/dannyjnwong/PreopDrugs", "Click here for the source code for this app."),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectizeInput("drug_name", "Search for drug names", 
                     choices = list("Type in a drug" = "", "Names" = drugs_ui$Drug), 
                     selected = NULL, 
                     multiple = TRUE,
                     options = NULL)
    ),
    
    mainPanel(
      tableOutput("drug_instructions")
    )
  )
))
