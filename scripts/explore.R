# Load libraries ----

library(tidyverse)
library(here)


# Read data ----


communities_tb <- read_csv(here("data/r-community-groups.csv"))


# Create plots ----

## compare community size in North America vs Africa splitting up into active/inactive

communities_tb %>% 
  ggplot(aes(Region, Size, fill = Status, label = Size)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(name = "Status", values = c("#BD3333", "#7C7879")) +
  theme_minimal() +
  theme(axis.text = element_text(size = 20))  +
  theme(axis.title = element_text(size = 20)) +
  theme(legend.text = element_text(size = 20)) +
  theme(legend.title = element_text(size = 20)) +
  scale_y_continuous(name="Members on MeetUp", labels = scales::comma)

communities_tb %>% 
  group_by(Region, Status) %>% 
  count() %>% 
  ggplot(aes(Region, n, fill = Status )) +
  geom_bar(stat = "identity") +
  scale_fill_manual(name = "Status", values = c("#BD3333", "#7C7879")) +
  theme_minimal() +
  theme(axis.text = element_text(size = 20))  +
  theme(axis.title = element_text(size = 20)) +
  theme(legend.text = element_text(size = 20)) +
  theme(legend.title = element_text(size = 20)) +
  scale_y_continuous(name="Groups on MeetUp", labels = scales::comma)


communities_tb %>% 
  ggplot(aes(Region, `Past events`)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(name = "Status", values = c("#BD3333", "#7C7879")) +
  theme_minimal() +
  theme(axis.text = element_text(size = 20))  +
  theme(axis.title = element_text(size = 20)) +
  theme(legend.text = element_text(size = 20)) +
  theme(legend.title = element_text(size = 20)) +
  scale_y_continuous(name="Past events", labels = scales::comma)

