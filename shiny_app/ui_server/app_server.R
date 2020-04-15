library(ggplot2)
source("../ui_server/global.R")
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

    
    output$dotPlot <- renderPlot({
      ggplot(data=data.frame(dose=c("D0.5", "D1", "D2"),
                             len=c(4.2, 10, 29.5)), 
             aes(x=dose, y=len, group=1)) +
        geom_line()+
        geom_point()
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

  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times") +
      coord_flip()
    
  })
  
  output$socialsPlot <- renderPlot({
    
  })
  
  output$sourcePages <- renderPlot({
    source_media %>% 
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
  output$previousPages <- renderPlot({
    previouse_page %>% 
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
  
  output$finalPage <- renderPlot({
    
  })
  
  output$referrals <- renderPlot({
    source_media %>% 
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
  
  output$per_medium <- renderPlot({
    source_media %>% 
      group_by(medium) %>% 
      summarise(sum = sum(pageviews)) %>% 
      arrange(desc(sum)) %>% 
      top_n(15) %>% 
      ggplot() +
      aes(x = reorder(medium, sum), y = sum) +
      geom_col()+
      coord_flip() +
      ggtitle("Number of webinars page views per medium") +
      xlab("medium") +
      ylab("number of webinars page views")
    
  })
}