# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  
  #filtering data for cc_vs_web
#FIRST TAB
  
  
  output$cc_vs_web <- renderPlot({
    all_pages %>% 
      filter(page_url %in% c("/","/webinars/")) %>% 
      filter(input$daterange1[1] <= date & date < input$daterange1[2] ) %>% 
      ggplot() +
      aes_string("date",input$variable, color  = "page_url" )+
      geom_line(size = 1)+
      ggtitle("Page views of CodeClan main page against Webinars page over the time.")+
      xlab("Date")+
      ylab("Number of pageviews") +
      theme(legend.title = element_text(colour="black", size=12))+
      guides(colour = guide_legend(override.aes = list(size=4)))+
      scale_color_discrete(name="Visited url")+
      theme_minimal()
    
    
    
  })
  
  #SECOND TAB
  filtered_source <- reactive({
    source_media %>% 
      filter(input$daterange2[1] < date & date < input$daterange2[2])
  })
  output$source <- renderPlot({
    filtered_source() %>% 
      group_by(source) %>% 
      summarise(sum = sum(pageviews)) %>% 
      arrange(desc(sum)) %>% 
      top_n(15) %>% 
      ggplot() +
      aes(x = reorder(source, sum), y = sum) +
      geom_col()+
      coord_flip() +
      ggtitle("Number of webinars page views per source") +
      xlab("source") +
      ylab("number of webinars page views")
    })
  output$social_network <- renderPlot({
    filtered_source() %>% 
      group_by(social_network) %>% 
      summarise(sum = sum(pageviews)) %>% 
      arrange(desc(sum)) %>% 
      top_n(15) %>% 
      ggplot() +
      aes(x = reorder(social_network, sum), y = sum) +
      geom_col()+
      coord_flip() +
      ggtitle("Number of webinars page views per social network") +
      xlab("social network") +
      ylab("number of webinars page views")
  })
  
  #THIRD TAB
  filtered_landing <- reactive({
    landing_page %>% 
      filter(input$daterange3[1] < date & date < input$daterange3[2])
    
  })
  filerting <- function(data){
    filtered <- data %>%
      filter(input$daterange3[1] < date & date < input$daterange3[2])
    
  }
  
  output$landing <- renderPlot({
    filerting(landing_page) %>% 
      group_by(landing_page_url) %>% 
      summarise(sum = sum(pageviews)) %>% 
      arrange(desc(sum)) %>% 
      top_n(10) %>% 
      ggplot() +
      aes(x = reorder(landing_page_url, sum), y = sum) +
      geom_col()+
      coord_flip() +
      ggtitle("Number of webinars page views per landing page") +
      xlab("landing page") +
      ylab("number of webinars page views")
  })
  
  output$previouse <- renderPlot({
    filerting(previouse_page) %>% 
      group_by(previous_page_url) %>% 
      summarise(sum = sum(pageviews)) %>% 
      arrange(desc(sum)) %>% 
      top_n(10) %>% 
      ggplot() +
      aes(x = reorder(previous_page_url, sum), y = sum) +
      geom_col()+
      coord_flip() +
      ggtitle("Number of webinars page views per previous page") +
      xlab("previous page") +
      ylab("number of webinars page views")
    
    
  }) 
  
  output$exit <- renderPlot({
    filerting(exit_page) %>% 
      mutate(left_from_webinars = ifelse(exit_page_url == "/webinars/", T, F)) %>% 
      group_by(left_from_webinars) %>% 
      summarise(number_rows = n()) %>% 
      ggplot() +
      aes(x = left_from_webinars, y = number_rows) +
      geom_col()+
      coord_flip() +
      ggtitle("Number of people who left the CodeClan web, depending on whether or not they left from webinars") +
      xlab("left from webinars") +
      ylab("number of people who left the CodeClan web")
    
  })
  
  
  
  #FOURTH TAB
  output$plot_4_1 <- renderPlot({
    
    source_media %>% 
      filter(input$daterange4[1] <= date & date < input$daterange4[2] ) %>% 
      
      group_by(has_social_source_referral) %>% 
      summarise(sum = sum(pageviews)) %>% 
      arrange(desc(sum)) %>% 
      top_n(15) %>% 
      ggplot() +
      aes(x = reorder(has_social_source_referral, sum), y = sum) +
      geom_col()+
      coord_flip() +
      ggtitle("Number of webinars page views depending on whether they come from a social source referral") +
      xlab("social source referral") +
      ylab("number of webinars page views")
  })
  
#
  
  

output$plot_4_2 <- renderPlot({
  exit_page %>% 
    filter(input$daterange4[1] <= date & date < input$daterange4[2] ) %>% 
    
    mutate(left_from_webinars = ifelse(exit_page_url == "/webinars/", T, F)) %>% 
    group_by(left_from_webinars) %>% 
    summarise(number_rows = n()) %>% 
    ggplot() +
    aes(x = left_from_webinars, y = number_rows) +
    geom_col()+
    coord_flip() +
    ggtitle("Number of people who left the CodeClan web, depending on whether or not they left from webinars") +
    xlab("left from webinars") +
    ylab("number of people who left the CodeClan web")
  
    
  
})
  
  # You can access the values of the widget (as a vector of Dates)
  # with input$dates, e.g.
  output$value <- renderPrint({ input$dates })
  
  #renders plot for second tab
  # output$dotPlot <- renderPlot({
  #   
  #   x    <- faithful$waiting
  #   bins <- seq(min(x), max(x), length.out = input$bins + 1)
  #   
  #   geom_line(x, breaks = bins, col = "#75AADB", border = "white",
  #        xlab = "Waiting time to next eruption (in mins)",
  #        main = "Histogram of waiting times")
  # })
  
}