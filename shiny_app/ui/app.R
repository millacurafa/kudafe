library(shiny)
library(shinythemes)
#library(d3Dashboard)
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
             
             #Starts fluidRow for the sidebar panel
             fluidRow(
               titlePanel("Referrals"),
              #Starts a new column to hold symbols
             column(6,
             #Starts a new row
             fluidRow(
               icon("google", lib = "font-awesome"), "Google"
               ),
               fluidRow(
               icon("envelope-open-text", lib = "font-awesome"),
               "Email"
               # #Adds ggplot graph
               # ggplot()+
               #  geom_col(
               #   aes(
               #   x = 1,
               #   y = 400,
               #   ), 
               #   fill = "black",
               #   width = .15
               # ) +
               #  coord_flip()+
               #   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
               #           panel.background = element_rect(), axis.line = element_blank(),
               #         axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(),
               #         axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()
               #         )+xlim(0.75, 1.25)+
               #   ylim(0, 1000)
               
                 ),
               fluidRow(
               icon("facebook-f", lib = "font-awesome"), "Facebook"
               ),
               fluidRow(
               icon("twitter", lib = "font-awesome"), "Twitter"
               ),
               fluidRow(
               icon("instagram", lib = "font-awesome"), "Instagram"
               ),
               fluidRow(
               icon("linkedin-in", lib = "font-awesome"), "LinkedIn"
               ),
               fluidRow(
               icon("reddit", lib = "font-awesome"), "Reddit"
               ),
             ), #Closes column
             #Starts second column to hold bulletgraph
              column(6, 
                     "trial text",
                    # ytd2005 <- list(
                    #   title=list("Revenue", "Profit", "Order Size", "New Customers", "Satisfaction"),
                    #   subtitle=list("US$, in thousands", "%", "US$, average", "count", "out of 5"),
                    #   range=list(c(150, 225, 300),
                    #              c(20, 25, 30),
                    #              c(350, 500, 600),
                    #              c(1400, 2000, 2500),
                    #              c(3.5, 4.25, 5)),
                    #   measures=list(c(220, 270),
                    #                 c(21, 23),
                    #                 c(100, 320),
                    #                 c(1000, 1650),
                    #                 c(3.2, 4.7)),
                    #   markers=list(250, 26, 550, 2100, 4.2)
                    # )
                    # # Plot
                    # bulletGraph(ytd2005)
                    # 
                    ) #Closes second column holding bulletgraph
             
             ) #Closes fluid row for icons and bullet graph
             
           ), #Closes sidebar panel
           #Starts main panel
           mainPanel(
           #
           #    Output: ----Histogram ----
           #   plotOutput(outputId = "dotPlot")
           #
           # ), # ---- Closes Histogram ----
"Trial text"
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