# Number of webinars page views depending on whether they come from a social source referral -----------------------------------------

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

# Number of people who left the CodeClan web, depending on whether or not they left from webinars -----------------------------------------

exit_page %>% 
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


