library("praise")
library("tidyverse")
data<-c(1,3,5,7,11,13,17)

rep(praise(),10)

rep(praise(),mean(diff(data)))

data %>%


data^2 %>%
  mean()%>%
  round(digits=1)

a+b+c %>%
  sqr