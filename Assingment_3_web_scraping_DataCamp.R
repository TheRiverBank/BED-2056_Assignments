library(tidyverse)
library(rvest)


r_url <- "https://learn.datacamp.com/courses/tech:r"
py_url <- "https://learn.datacamp.com/courses/tech:python"
scraped = Sys.time()
r_courses <- read_html(r_url)
py_courses <- read_html(py_url)
str(r_courses)
str(py_courses)

r_course_names <- r_courses %>% 
  html_nodes("[class*='course-block__title']") %>%
  html_text()
 
py_course_names <- py_courses %>% 
  html_nodes("[class*='.course-block__title']") %>%
  html_text()

dfR_courses = data.frame(course=r_course_names, tech="R", language="R")
dfPy_courses = data.frame(course=py_course_names, tech="Python", language="Python")

df = bind_rows(dfR_courses, dfPy_courses)

