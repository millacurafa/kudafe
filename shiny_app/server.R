library(lubridate)
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
      aes_string("date", input$variable, fill  = "page_url" )+
      geom_col(size = 1)+
      ggtitle("Page views of CodeClan main page against Webinars page over the time.")+
      xlab("Date")+
      ylab("Number of pageviews") +
      theme(legend.title = element_text(colour="black", size=12))+
      guides(colour = guide_legend(override.aes = list(size=4)))+
      scale_color_discrete(name="Visited url")+
      theme_minimal() +
      theme(axis.text.x = element_text(margin = margin(t = 1.4, unit = "cm")),
            axis.ticks.length.x = unit(-1, "cm"),)+
      geom_text(aes(
        label = wday(date, label=TRUE),
        y =  -5,
        hjust = 1
      ), color = "gray", angle = 45)
    
    
    
  })
  
  #SECOND TAB
  filtered_source <- reactive({
    source_media %>% 
      filter(input$daterange2[1] < date & date < input$daterange2[2])
  })
  
  sources_social_networks <- reactive({
    var2 = sym(input$variable2)
    sources <- filtered_source() %>% 
              group_by(source) %>% 
              summarise(sum = sum(!!var2))
    
   
    
  })
  
  output$facebook <- renderText({
     sources_social_networks() %>% 
      filter(source == "m.facebook.com" | source == "lm.facebook.com" | source == "l.facebook.com" | source == "facebook.com") %>% 
       summarise(sum(sum))%>% 
       pull()
  })
  
  output$instagram <- renderText({
    sources_social_networks() %>% 
      filter(source == "m.instagram.com" | source == "lm.instagram.com" | source == "l.instagram.com" | source == "instagram.com") %>% 
      summarise(sum(sum))%>% 
      pull()
  })
  
  output$twitter <- renderText({
    sources_social_networks() %>% 
      filter(source == "t.co" | source == "twitter.com") %>% 
      summarise(sum(sum))%>% 
      pull()
  })
  
  output$google <- renderText({
    sources_social_networks() %>% 
      filter(source == "google.com" | source == "google") %>% 
      summarise(sum(sum))%>% 
      pull()
  })
  
  output$linkedin <- renderText({
    sources_social_networks() %>% 
      filter(source == "linkedin.com" | source == "linkedin") %>% 
      summarise(sum(sum))%>% 
      pull()
  })
  
  output$email <- renderText({
    sources_social_networks() %>% 
      filter(source == "CodeClan Employer Partners 2018" | source == "Website Subscribers" | source == "CodeClan Staff newsletter" | source == "Alumni Dec 2019") %>% 
      summarise(sum(sum))%>% 
      pull()
  })
  
  output$reddit <- renderText({
    sources_social_networks() %>% 
      filter(source == "reddit.com") %>% 
      summarise(sum(sum))%>% 
      pull()
  })
  
  output$source <- renderPlot({
    var2 = sym(input$variable2)
    filtered_source() %>% 
      group_by(source) %>% 
      summarise(sum = sum(!!var2)) %>% 
      arrange(desc(sum)) %>% 
      top_n(15) %>% 
      ggplot() +
      aes(x = reorder(source, sum), y = sum, fill = source) +
      geom_col()+
      coord_flip() +
      # ggtitle("Number of webinars page views per source") +
      xlab("source") +
      ylab("number of webinars page views")
    })
  
  output$social_network <- renderPlot({
    var = sym(input$variable2)
    filtered_source() %>% 
      group_by(social_network) %>% 
      summarise(sum = sum(!!var)) %>% 
      arrange(desc(sum)) %>% 
      top_n(15) %>% 
      ggplot() +
      aes(x = reorder(social_network, sum), y = sum, fill = social_network) +
      geom_col()+
      coord_flip() +
      # ggtitle("Number of webinars page views per social network") +
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
    
    var = sym(input$variable3)
    filerting(landing_page) %>% 
      group_by(landing_page_url) %>% 
      summarise(sum = sum(!!var)) %>% 
      arrange(desc(sum)) %>% 
      top_n(10) %>% 
      ggplot() +
      aes(x = reorder(landing_page_url, sum), y = sum, fill = landing_page_url) +
      geom_col(show.legend = FALSE)+
      coord_flip() +
      # ggtitle("Number of webinars page views per landing page") +
      xlab("landing page") +
      ylab("number of webinars page views")+
      ylim(0, 300)+
      theme(
            axis.text.y=element_blank(),
            axis.ticks.y=element_blank()) + 
      geom_text(aes(
        label = landing_page_url,
        y = sum + 10,
        hjust = 0
      ))
  })
  
  totalvisitors <- reactive({
    var = sym(input$variable3)
    filerting(landing_page) %>% 
      summarise(sum(!!var)) %>% 
      pull() %>% 
      as.numeric()
  })
  output$totalVisitors <- renderText({
    totalvisitors()
  })
  
  totalwebinars <- reactive({
    filerting(exit_page) %>% 
      summarise(n()) %>% 
      pull() %>% 
      as.numeric()
  })
  
  output$totalWebinars <- renderText({
    totalwebinars()
  })
  
    output$totalYield <- renderText({
     totalwebinars() / totalvisitors()
  }) 
  
  output$previouse <- renderPlot({
    var = sym(input$variable3)
    filerting(previouse_page) %>% 
      group_by(previous_page_url) %>% 
      summarise(sum = sum(!!var)) %>% 
      arrange(desc(sum)) %>% 
      top_n(10) %>% 
      ggplot() +
      aes(x = reorder(previous_page_url, sum), y = sum, fill = previous_page_url) +
      geom_col(show.legend = FALSE)+
      coord_flip() +
      # ggtitle("Number of webinars page views per previous page") +
      xlab("previous page") +
      ylab("number of webinars page views")+
      ylim(0, 300)+
      theme(
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) + 
      geom_text(aes(
        label = previous_page_url,
        y = sum + 10,
        hjust = 0
      ))
    
    
  }) 
  
  output$exit <- renderPlot({
    filerting(exit_page) %>% 
      mutate(left_from_webinars = ifelse(exit_page_url == "/webinars/", T, F)) %>% 
      group_by(left_from_webinars) %>% 
      summarise(number_rows = n()) %>% 
      ggplot() +
      aes(x = left_from_webinars, y = number_rows, fill = left_from_webinars) +
      geom_col()+
      coord_flip() +
      # ggtitle("Number of people who left the CodeClan web, depending on whether or not they left from webinars") +
      xlab("left from webinars") +
      ylab("number of people who left the CodeClan web") +
      theme(legend.position = "top")
    
  })
  
  
  
  #FOURTH TAB
  output$plot_4_1 <- renderPlot({
    var  = sym(input$variable4)
    source_media %>% 
      filter(input$daterange4[1] <= date & date < input$daterange4[2] ) %>% 
      
      group_by(has_social_source_referral) %>% 
      summarise(sum = sum(!!var)) %>% 
      arrange(desc(sum)) %>% 
      top_n(15) %>% 
      ggplot() +
      aes(x = reorder(has_social_source_referral, sum), y = sum, fill = has_social_source_referral) +
      geom_col()+
      coord_flip() +
      # ggtitle("Number of webinars page views depending on whether they come from a social source referral") +
      xlab("social source referral") +
      ylab("number of webinars page views")
  })
  
#
  
  

output$plot_4_2 <- renderPlot({
  #var  = sym(input$variable4)
  
  exit_page %>% 
    filter(input$daterange4[1] <= date & date < input$daterange4[2] ) %>% 
    
    mutate(left_from_webinars = ifelse(exit_page_url == "/webinars/", T, F)) %>% 
    group_by(left_from_webinars) %>% 
    summarise(number_rows = n()) %>% 
    ggplot() +
    aes(x = left_from_webinars, y = number_rows, fill = left_from_webinars) +
    geom_col()+
    coord_flip() +
    # ggtitle("Number of people who left the CodeClan web, depending on whether or not they left from webinars") +
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