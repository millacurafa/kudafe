library(shiny)
library(shinythemes)
library(tidyverse)
#library(hrbrthemes)


#Read in csv files

previouse_page <- read_csv("data/previouse_page.csv")
landing_page <- read_csv("data/landing_page.csv")
exit_page <- read_csv("data/exit_page.csv")
source_media <- read_csv("data/source_media.csv")
all_pages <- read_csv("data/all_pages.csv")



# cc_vs_web <- function(min,max){
#   all_pages %>% 
#     filter(page_url %in% c("/","/webinars/")) %>% 
#     filter(min < date & date < max ) %>% 
#     ggplot() +
#     aes(date,pageviews, color  = page_url )+
#     geom_line(size = 1)+
#     ggtitle("Page views of CodeClan main page against Webinars page over the time.")+
#     xlab("Date")+
#     ylab("Number of pageviews") +
#     theme(legend.title = element_text(colour="black", size=12))+
#     guides(colour = guide_legend(override.aes = list(size=4)))+
#     scale_color_discrete(name="Visited url")
# }

