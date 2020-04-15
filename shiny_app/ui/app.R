library(shiny)
library(shinythemes)
library(tidyverse)



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
                  value = 30),
      # Create range selector
      dateRangeInput("dates", label = h3("Date range")),
      hr(),
      fluidRow(column(4, verbatimTextOutput("value"))),
      
    ),
    
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
  tabPanel("Sources Plot",
           sidebarPanel(
             # Copy the chunk below to make a group of checkboxes
             checkboxGroupInput("checkGroup", label = h3("Checkbox group"), 
                                choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
                                selected = 1),
             hr(),
             fluidRow(
               icon("google", lib = "font-awesome"),
               ),
               fluidRow(
               icon("envelope-open-text", lib = "font-awesome"),
               #Adds ggplot graph
               ggplot()+
                geom_col(
                 aes(
                 x = 1,
                 y = 400,
                 ), 
                 fill = "black",
                 width = .15
               ) +
                coord_flip()+
                 theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                         panel.background = element_rect(), axis.line = element_blank(),
                       axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(),
                       axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()
                       )+xlim(0.75, 1.25)+
                 ylim(0, 1000)
               
                 ),
               fluidRow(
               icon("facebook-f", lib = "font-awesome"),
               ),
               fluidRow(
               icon("twitter", lib = "font-awesome"),
               ),
               fluidRow(
               icon("instagram", lib = "font-awesome"),
               ),
               fluidRow(
               icon("linkedin-in", lib = "font-awesome"),
               ),
               fluidRow(
               icon("reddit", lib = "font-awesome")
               ),
               
           #Closes sidebar panel
           ),
           #Starts main panel
           mainPanel(
           #
           #    Output: ----Histogram ----
           #   plotOutput(outputId = "dotPlot")
           #
           # ),

           #Closes main panel
            )
           #Closes second tab
           ),
  
  # ---- Third tab to be created ----
  tabPanel("Random General Plot",
           #Closes third tab
  ),
  # ---- Fourth tab to be created ----
  tabPanel("Random Information",
           #Closes fourth tab
  )
    #Closes tabset panel
  )
#Closes fluidPage
)

shinyApp(ui, server)