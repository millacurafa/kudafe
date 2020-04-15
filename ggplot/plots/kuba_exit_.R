
# Still not sure if this is calid code. Somthing fishy about it ....
exit_page %>% 
  mutate(webinar_exit = if_else(exit_page_url == "/webinars/","Yes","No")) %>% 
  group_by(date,webinar_exit) %>% 
  summarise(exits_w = n()) %>% 
  ggplot() +
  aes(date,exits_w, color = webinar_exit)+
  geom_line()