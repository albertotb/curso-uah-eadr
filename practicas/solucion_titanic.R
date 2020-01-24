library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)

#1
data <- read_csv("titanic.csv")

#2
data %>%
  summarise(Per=mean(Survived)*100)

#3
data %>%
  summarise_all(funs(mean(is.na(.))*100))

#4
data1 <- select(data, -Cabin)

#5
data2 <- data1 %>%
  separate(Name, c("Surname", "Title", "FirstName"), sep="[,\\.]", extra="merge", remove=F) %>%
  mutate(Title = trimws(Title),
         Title = case_when(
           Title == "Master" ~ "Master",
           Title == "Mr" ~ "Mr",
           Title %in% c("Mrs", "Ms", "Mme") ~ "Mrs",
           Title %in% c("Miss", "Mmlle") ~ "Miss",
           TRUE ~ "Otros"))

#6
data3 <- data2 %>%
  group_by(Pclass, Title) %>%  
  mutate(Age = replace(Age, is.na(Age), median(Age, na.rm=T))) %>%
  ungroup()

#7
data4 <- drop_na(data3)

#8
data4 %>%
  group_by(Sex) %>%
  summarise(Prob=mean(Survived))

#9
data4 %>%
  group_by(Age) %>%
  summarise(Prob=mean(Survived))

#10,11,12
data5 <- data4 %>%
  mutate(Survived = factor(Survived, labels=c("No", "Yes")),
         Decade = cut(Age, seq(0, max(Age, na.rm=T), 10)),
         Familysize = Parch + SibSp + 1,
         Singleton = Familysize == 1)

#13
ggplot(data5, aes(x=Fare, y=Age, color=Survived)) + geom_point()

#14
ggplot(data5, aes(x=Age)) + geom_histogram()

#15
data5 %>%
  filter(Survived == "Yes") %>%
  ggplot(aes(x=Pclass, fill=Sex)) + geom_bar(position="dodge")

#16
data5 %>%
  count(Familysize, Pclass)

#17
ggplot(data5, aes(x=Age, color=Sex, fill=Sex)) + geom_histogram(alpha=0.5)

#18
ggplot(data5, aes(x=Title, y=Age)) + geom_boxplot()

#19
ggplot(data5, aes(x=Title, fill=Survived)) + geom_bar(position="dodge")

#20
ggplot(data5, aes(x=Age, y=Title, color=Survived)) + geom_point() + facet_wrap(~Pclass)

#21
data6 <- read_csv2("titanic2.csv")

#22
data5 %>%
  filter(duplicated(Name))

data6 %>%
  filter(duplicated(name))

#23
data7 <- left_join(data5, data6, by=c("Name"="name", "Ticket"="ticket"))

#24
data7 %>%
  filter(Survived == "Yes") %>%
  summarise(Per=mean(!is.na(boat)))

#25
df1 <- sample_frac(data7, 0.7)
df2 <- anti_join(data7, df1, by="PassengerId")
