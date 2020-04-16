
# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  #Theme to be chosen from shinithemes library
  theme = shinytheme("darkly"),
  
  # App title ----
  titlePanel("CodeClan Webinar's web traffic analysis"),
  #Here we start working with the first tabs by generating a TAB holder/panel
  tabsetPanel(
    # ---- First tab to be created ----
    tabPanel("Website overview",
             
             # ---- Sidebar layout with input and output definitions ----
             sidebarLayout(
               
               # ---- Sidebar panel for inputs ----
               sidebarPanel(
                 
                 # ---- Input: Slider for the number of bins ----older
               
                 # Create range selector
                 dateRangeInput("daterange1", "Date range:",
                                start = min(all_pages$date),
                                end = max(all_pages$date),
                                min = min(all_pages$date),
                                max =max(all_pages$date)),
                 hr(),
                 selectInput("variable", "What to plot?",
                             choices = c("pageviews",
                                         "unique_pageviews"
                                         )
                   
                 ),
                 
                 fluidRow(
                   column(4,
                          ""
                          
                   )
                   ),
                 
               ),
               
               # ---- Ends Sidebar panel for inputs ----
               # ---- Main panel for displaying outputs ----
               mainPanel(
                 
                 # Output: Histogram ----
                 plotOutput(outputId = "cc_vs_web")
                 
               )
               # ---- Ends Main panel for displaying outputs ----
             )
             #Closes first tab
    ),
    # ---- Second tab to be created ----
    tabPanel("Sources of web traffic",
             fluidRow(
               column(6,
               # Copy the chunk below to make a group of checkboxes
               dateRangeInput("daterange2", "Date range:",
                              start = min(all_pages$date),
                              end = max(all_pages$date),
                              min = min(all_pages$date),
                              max =max(all_pages$date)
                              )
               ),
               column(6,
               selectInput("variable2", "What to plot?",
                           choices = c("pageviews",
                                       "unique_pageviews")
                           )
               )
               
                                
             ),
               hr(),
               
               #Starts fluidRow for the sidebar panel
               
             #Closes sidebar panel
             #Starts main panel
             # mainPanel(
               fluidRow(
                 #Starts a new column to hold symbols
                 column(6,
                        "PLOT1",
                        plotOutput("source")
                        #Starts a new row
                        
                 ), #Closes column
                 #Starts second column to hold bulletgraph
                 column(6, 
                        "PLOT2",
                        plotOutput("social_network")
                        
                 ) #Closes second column holding bulletgraph
                 
               ), #Closes fluid row for icons and bullet graph
               
               #
               #    Output: ----Histogram ----
               #   plotOutput(outputId = "dotPlot")
               #
               # ), # ---- Closes Histogram ----
               # "Trial text"
               #  ) Closes main panel
            
             #Closes second tab
    ),
    
    # ---- Third tab to be created ----
    tabPanel("User journey",
             fluidPage(
               fluidRow(
                 column(4,selectInput("variable3", "What to plot?",
                                      choices = c("pageviews",
                                                  "unique_pageviews")
                                      )
                        ),
                 
                 column(4,dateRangeInput("daterange3", "Date range:",
                                         start = min(all_pages$date),
                                         end = max(all_pages$date),
                                         min = min(all_pages$date),
                                         max =max(all_pages$date)
                          )
                        ),
                # column(4,
                #               "Plot3",
                #               plotOutput("exit")
                #               )

               ),
               
               fluidRow(
                 column(4,
                        "PLOT1",
                        plotOutput("landing")
                        ),
                 column(4,
                        "PLOT2",
                        plotOutput("previouse")
                        
                        ),
                 column(4,
                        "Plot3",
                        plotOutput("exit")
                        )
               )
             )
             #Closes third tab
    ),
    # ---- Fourth tab to be created ----
    tabPanel("Miscellaneous",
             #Closes fourth tab
             fluidPage(
               fluidRow(

                 column(6,
                        selectInput("variable4", "What to plot?",
                                      choices = c("pageviews",
                                                  "unique_pageviews")
                        
                                    )
                        ),
                 column(6, 
                        dateRangeInput("daterange4", "Date range:",
                                          start = min(all_pages$date),
                                          end = max(all_pages$date),
                                          min = min(all_pages$date),
                                          max =max(all_pages$date)
                 )
                        
                        ),
                 
               ),

                 fluidRow(
                      column(6,
                             "Plot1",
                             plotOutput("plot_4_1")
                             ),
                      column(6,
                             "Plot2",
                             plotOutput("plot_4_2")
                             )
                 )
                 
               ) #Closes fluid page
             ) #Closes tab panel
            
    #Closes tabset panel
  )
  #Closes fluidPage
)


