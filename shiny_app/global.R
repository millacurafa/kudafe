library(shiny)
library(shinythemes)
library(tidyverse)
getwd()


#Read in csv files

previouse_page <- read_csv("data/previouse_page.csv")
landing_page <- read_csv("data/landing_page.csv")
exit_page <- read_csv("data/exit_page.csv")
source_media <- read_csv("data/source_media.csv")
all_pages <- read_csv("data/all_pages.csv")