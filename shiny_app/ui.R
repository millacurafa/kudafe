
# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  #Theme to be chosen from shinithemes library
  theme = shinytheme("darkly"),
  
  # App title ----
  titlePanel("Webinar's web traffic analysis"),
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
             hr(),
             fluidRow(
               column(4,
               # Copy the chunk below to make a group of checkboxes
               dateRangeInput("daterange2", "Date range:",
                              start = min(all_pages$date),
                              end = max(all_pages$date),
                              min = min(all_pages$date),
                              max =max(all_pages$date)
                              )
               ),
               column(4,
               selectInput("variable2", "What to plot?",
                           choices = c("pageviews",
                                       "unique_pageviews")
                           )
               ),
               column(4,
                      column(4,
                      fluidRow(
                        icon("google", lib = "font-awesome"), "Google", textOutput("google")
                      ),
                      fluidRow(
                        icon("envelope-open-text", lib = "font-awesome"), "Email", textOutput("email")
                      ),
                      fluidRow(
                        icon("linkedin-in", lib = "font-awesome"), "LinkedIn", textOutput("linkedin")
                      ),#Closes internal column
                     
                      ),
                      column(4,
                             fluidRow(
                               icon("facebook-f", lib = "font-awesome"), "Facebook", textOutput("facebook")
                             ),
                             fluidRow(
                               icon("instagram", lib = "font-awesome"), "Instagram", textOutput("instagram")
                             ),
                             fluidRow(
                               icon("twitter", lib = "font-awesome"), "Twitter", textOutput("twitter")
                             ),
                             
                      ),#Closes internal column
                      column(4, 
                             fluidRow(
                               icon("reddit", lib = "font-awesome"), "Reddit", textOutput("reddit")
                             )
                             )#Closes internal column
                      ) #Closes column
               
                                
             ),
               hr(),
               
               #Starts fluidRow for the sidebar panel
               
             #Closes sidebar panel
             #Starts main panel
             # mainPanel(
               fluidRow(
                 #Starts a new column to hold symbols
                 column(6,
                        "Number of webinars page views per source",
                        plotOutput("source")
                        #Starts a new row
                        
                 ), #Closes column
                 #Starts second column to hold bulletgraph
                 column(6, 
                        "Number of webinars page views per social network",
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
               hr(),
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
                 column(4, 
                        column(4, "Visitors: ",
                               textOutput("totalVisitors")),
                        column(4, "Webinars: ",
                               textOutput("totalWebinars")),
                        column(4, "Engagement: ",
                               textOutput("totalYield"))
                 )
               ),
               
               fluidRow(
                 column(4,
                        "Number of webinars page views per landing page",
                        plotOutput("landing")
                        ),
                 column(4,
                        "Number of webinars page views per previous page",
                        plotOutput("previouse")
                        
                        ),
                 column(4,
                        "Number of people who left the CodeClan web, depending on whether or not they left from webinars",
                        plotOutput("exit")
                        ),
                 
                 
               )
             )
             #Closes third tab
    ),
    # ---- Fourth tab to be created ----
    tabPanel("Miscellaneous",
             #Closes fourth tab
             fluidPage(
               hr(),
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
                             "Number of webinars page views depending on whether they come from a social source referral",
                             plotOutput("plot_4_1")
                             ),
                      column(6,
                             "Number of people who left the CodeClan web, depending on whether or not they left from webinars",
                             plotOutput("plot_4_2")
                             )
                 )
                 
               ) #Closes fluid page
             ) #Closes tab panel
            
    #Closes tabset panel
  )
  #Closes fluidPage
)


