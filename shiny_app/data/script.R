library(googleAnalyticsR)
library(keyring)
library(tidyverse)
library(lubridate)
library(janitor)

options(googleAuthR.client_id = keyring::key_get(service = "ga_client_id", keyring = "googleanalytics"))

options(googleAuthR.client_secret = keyring::key_get(service = "ga_client_secret", keyring = "googleanalytics"))

devtools::reload(pkg = devtools::inst("googleAnalyticsR"))

#Authenticate your account
ga_auth()

1#Get a list of accounts you have access to
account_list <- ga_account_list()

#ViewID is the way to access the account you want
viewid<- account_list$viewId[1]

# First call previous page
previouse_page <-  google_analytics(
  viewid,
  date_range = c("2020-03-15", as.character(today())),
  metrics = c("pageviews", "uniquePageviews"),
  dimensions = c(
    "ga:pageTitle",
    "pagePath",
    "ga:date",
    "ga:dayOfWeekName",
    "ga:previousPagePath"
  ),
  filters = "ga:pagePath=~/webinars/"
) %>% clean_names() %>%
  separate(
    previous_page_path,
    into = c("previous_page_url", "after_"),
    sep = "[?]"
  ) %>% select(-after_)

#CSV file 
write_csv(previouse_page,"previouse_page.csv")
# Second call landing page

landing_page <-  google_analytics(
  viewid,
  date_range = c("2020-03-15", as.character(today())),
  metrics = c("pageviews", "uniquePageviews"),
  dimensions = c(
    "ga:pageTitle",
    "pagePath",
    "ga:date",
    "ga:dayOfWeekName",
    "ga:landingPagePath"
  ),
  filters = "ga:pagePath=~/webinars/"
) %>% clean_names() %>%
  separate(landing_page_path,
           into = c("landing_page_url", "after_"),
           sep = "[?]") %>% select(-after_)

# CSV 
write_csv(landing_page,"landing_page.csv")
# Third call exit page
exit_page <-  google_analytics(
  viewid,
  date_range = c("2020-03-15", as.character(today())),
  metrics = c("ga:exits", "ga:exitRate"),
  dimensions = c(
    "ga:exitPagePath",
    "pagePath",
    "ga:date",
    "ga:dayOfWeekName"
  ),
  filters = "ga:pagePath=~/webinars/"
) %>% clean_names() %>%
  separate(exit_page_path,
           into = c("exit_page_url", "after_"),
           sep = "[?]") %>% select(-after_)
# CSV 
write_csv(exit_page,"exit_page.csv")

# Source media
source_media <-  google_analytics(
  viewid,
  date_range = c("2020-03-15", as.character(today())),
  metrics = c("pageviews", "uniquePageviews"),
  dimensions = c(
    "pagePath",
    "ga:date",
    "ga:dayOfWeekName",
    "ga:sourceMedium",
    "ga:source",
    "ga:medium",
    "ga:socialNetwork",
    "ga:hasSocialSourceReferral"
    
  ),
  filters = "ga:pagePath=~/webinars/"
) %>% clean_names()

write_csv(source_media,"./source_media.csv")

# all pages just in case

all_pages <- google_analytics(
  viewid,
  date_range = c("2020-03-15", as.character(today())),
  metrics = c("pageviews", "ga:uniquePageviews"),
  dimensions = c("pagePath",
                 "pageTitle",
                 "ga:date"),
  max = -1
) %>% clean_names() %>%
  separate(page_path,
           into = c("page_url", "after"),
           sep = "[?]") %>% select(-after)

write_csv(all_pages,"all_pages.csv")

