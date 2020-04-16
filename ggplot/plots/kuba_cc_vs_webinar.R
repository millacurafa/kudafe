library(tidyverse)

all_pages %>% 
  filter(page_url %in% c("/","/webinars/")) %>% 
  select(page_url,date,pageviews,page_title) %>% 
  ggplot() +
  aes(date,pageviews, color  = page_url )+
  geom_line(size = 1)+
  ggtitle("Page views of CodeClan main page against Webinars page over the time.")+
  xlab("Date")+
  ylab("Number of pageviews") +
  theme(legend.title = element_text(colour="black", size=12))+
  guides(colour = guide_legend(override.aes = list(size=4)))+
  scale_color_discrete(name="Visited url")