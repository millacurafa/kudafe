source("../ui_server/global.R")

head(previouse_page)

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

# Number of webinars unique page views per previous page---------------------------------------------

previouse_page %>% 
  group_by(previous_page_url) %>% 
  summarise(sum = sum(unique_pageviews)) %>% 
  arrange(desc(sum)) %>% 
  top_n(10) %>% 
  ggplot() +
  aes(x = reorder(previous_page_url, sum), y = sum) +
  geom_col()+
  coord_flip() +
  ggtitle("Number of webinars unique page views per previous page") +
  xlab("previous page") +
  ylab("number of webinars unique page views")


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

# Number of webinars unique page views per landing page---------------------------------------------

landing_page %>% 
  group_by(landing_page_url) %>% 
  summarise(sum = sum(unique_pageviews)) %>% 
  arrange(desc(sum)) %>% 
  top_n(10) %>% 
  ggplot() +
  aes(x = reorder(landing_page_url, sum), y = sum) +
  geom_col()+
  coord_flip() +
  ggtitle("Number of webinars unique page views per landing page") +
  xlab("landing page") +
  ylab("number of webinars unique page views")

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

# Number of webinars unique page views per source --------------------------------------

source_media %>% 
  group_by(source) %>% 
  summarise(sum = sum(unique_pageviews)) %>% 
  arrange(desc(sum)) %>% 
  top_n(15) %>% 
  ggplot() +
  aes(x = reorder(source, sum), y = sum) +
  geom_col()+
  coord_flip() +
  ggtitle("Number of webinars unique page views per source") +
  xlab("source") +
  ylab("number of webinars unique page views")

# Number of webinars page views per medium --------------------------------------

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

# Number of webinars unique page views per medium --------------------------------------

source_media %>% 
  group_by(medium) %>% 
  summarise(sum = sum(unique_pageviews)) %>% 
  arrange(desc(sum)) %>% 
  top_n(15) %>% 
  ggplot() +
  aes(x = reorder(medium, sum), y = sum) +
  geom_col()+
  coord_flip() +
  ggtitle("Number of webinars unique page views per medium") +
  xlab("medium") +
  ylab("number of webinars unique page views")


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

# Number of webinars unique page views depending on whether they come from a social source referral -----------------------------------------

source_media %>% 
  group_by(has_social_source_referral) %>% 
  summarise(sum = sum(unique_pageviews)) %>% 
  arrange(desc(sum)) %>% 
  top_n(15) %>% 
  ggplot() +
  aes(x = reorder(has_social_source_referral, sum), y = sum) +
  geom_col()+
  coord_flip() +
  ggtitle("Number of webinars unique page views depending on whether they come from a social source referral") +
  xlab("social source referral") +
  ylab("number of webinars unique page views")
