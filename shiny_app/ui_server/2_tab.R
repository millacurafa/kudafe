# Number of webinars page views per source --------------------------------------

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


# Number of webinars page views per social network --------------------------------------

source_media %>% 
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