library(shiny)
library(shinythemes)
# library(dplyr)
# library(ggplot2)


source("../ui_server/app_server.R")
# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  #Theme to be chosen from shinithemes library
  theme = shinytheme("darkly"),
  
  # App title ----
  titlePanel("CodeClan Webinar's web trafic analysis"),
  #Here we start working with the first tabs by generating a TAB holder/panel
  tabsetPanel(
    # ---- First tab to be created ----
    tabPanel("Random Sample Plot",
  
  # ---- Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # ---- Sidebar panel for inputs ----
    sidebarPanel(
      
      # ---- Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      
    ),
    # Cdate range selector
    dateRangeInput("dates", label = h3("Date range")),
    hr(),
    fluidRow(column(4, verbatimTextOutput("value"))),
    # ---- Ends Sidebar panel for inputs ----
    # ---- Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
        )
    # ---- Ends Main panel for displaying outputs ----
      )
    #Closes first tab
    ),
  # ---- Second tab to be created ----
  tabPanel("Random Dot Plot",
           #Closes second tab
           ),
  # ---- Third tab to be created ----
  tabPanel("Random General Plot",
           #Closes third tab
  ),
  # ---- Third tab to be created ----
  tabPanel("Random Information",
           #Closes fourth tab
  )
    #Closes tabset panel
  )
#Closes fluidPage
)

shinyApp(ui, server)