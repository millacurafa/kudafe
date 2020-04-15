# Number of webinars page views per previous page---------------------------------------------

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


# Number of webinars page views per landing page---------------------------------------------

landing_page %>% 
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