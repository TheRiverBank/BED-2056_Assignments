library(tidyverse)
library(rvest)
library(dplyr)

url <- "http://timeplan.uit.no/emne_timeplan.php?sem=20h&module%5B%5D=BED-2056-1&View=list"

scraped = Sys.time()
webpage <- read_html(url)
str(webpage)

date <- dmy(gsub("[a-zA-Z ]", "", webpage %>% html_nodes("td:nth-child(1)") %>% html_text()))
time <- webpage %>% html_nodes("td:nth-child(2)") %>% html_text()
room <- webpage %>% html_nodes("td:nth-child(3)") %>% html_text()
course_code <- webpage %>% html_nodes("td:nth-child(4)") %>% html_text()
description <- webpage %>% html_nodes(".act-summary") %>% html_text()
professor <- webpage %>% html_nodes(".staff_url") %>% html_text()

df <- data.frame(date, time, room, course_code, description, professor)
View(df)