#####Load packages for data scrapping, analysis, and data visualization#####
# install.packages("tidyverse")
# install.packages("ggplot2")
# install.packages("lme4")
# install.packages("xml2")
# install.packages("XML")
# install.packages("plyr")
##### Load Required packages#####
require(XML)
require(plyr)
require(tidyverse)
require(tidylog)
require(methods)
library(xml2)
#redudant packages were needed to work with the xml fomart output but BGG website,
#It seems whatever format the website outputs the information in a way where XML parse from xml2 and other packages doesnt fully show the names/values
#I came up with a work around for XML -> list -> subset to info we need -> df

#####Everything below this point is commented out because its not needed in the main analysis pipeline. This code is for extracting relevant info from xml format given by BGG api#####
#This code parses and extracts relevant information stored in boardgamegeeks api. If someone wants to update in the future (xmls were printed winter 2023/spring2024)
#They can use this code to parse and extract bits available through the bgg api.
#To uncomment all lines of code for use you can use shift + cmd (Mac) + C


#This first set of code is commented out so readers can understand every bit of this code.
#This code is replicated for every game designed and printed by Splotter Spiel.
#Beest stats
#Parses XML
# BeestXML<-xmlParse("Beest.xml", useInternalNodes = TRUE)
# #Converts the xml to list
# BeestLS<-xmlToList(BeestXML)
# #Subsets list to item information
# BeestLS2<-BeestLS$item
# #Subsets list to statistics information for the item
# BeestLS3<-BeestLS2$statistics
# #Converts list to dataframe so we can work with it using tidyverse
# BeestDF<-data.frame(BeestLS3)
# #Adds a column with title of the game
# BeestDF$name<-"Beest"
# #Subsets new dataframe to one distinct row per game and gives us the columns we want.
# BeestDF <- BeestDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(BeestXML,BeestLS,BeestLS2,BeestLS3)


#Bus stats
# BusXML<-xmlParse("Bus.xml", useInternalNodes = TRUE)
# BUSLS<-xmlToList(BusXML)
# BUSLS<-BUSLS$item
# BUSLS<-BUSLS$statistics
# BusDF<-data.frame(BUSLS)
# BusDF$name<-"Bus"
# BUSDF <- BusDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(BusXML,BUSLS,BUSLS2,BUSLS3)
# 
# 
# #Cannes stats
# CannesXML<-xmlParse("Cannes- Stars, Scripts and Screens.xml", useInternalNodes = TRUE)
# CannesLS<-xmlToList(CannesXML)
# CannesLS2<-CannesLS$item
# CannesLS3<-CannesLS2$statistics
# CannesDF<-data.frame(CannesLS3)
# CannesDF$name<-"Cannes"
# CannesDF <- CannesDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(CannesXML,CannesLS,CannesLS2,CannesLS3)
# 
# 
# 
# #Draf stats
# DrafXML<-xmlParse("Draf.xml", useInternalNodes = TRUE)
# DrafLS<-xmlToList(DrafXML)
# DrafLS2<-DrafLS$item
# DrafLS3<-DrafLS2$statistics
# DrafDF<-data.frame(DrafLS3)
# DrafDF$name<-"Draf"
# DrafDF <- DrafDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(DrafXML,DrafLS,DrafLS2,DrafLS3)
# 
# 
# 
# # #Antiquity stats
# AntiquityXML<-xmlParse("Antiquity.xml", useInternalNodes = TRUE)
# AntiquityLS<-xmlToList(AntiquityXML)
# AntiquityLS2<-AntiquityLS$item
# AntiquityLS3<-AntiquityLS2$statistics
# AntiquityDF<-data.frame(AntiquityLS3)
# AntiquityDF$name<-"Antiquity"
# AntiquityDF <- AntiquityDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(AntiquityXML,AntiquityLS,AntiquityLS2,AntiquityLS3)
# 
# 
# #DuckDealer stats
# DuckDealerXML<-xmlParse("DuckDealer.xml", useInternalNodes = TRUE)
# DuckDealerLS<-xmlToList(DuckDealerXML)
# DuckDealerLS2<-DuckDealerLS$item
# DuckDealerLS3<-DuckDealerLS2$statistics
# DuckDealerDF<-data.frame(DuckDealerLS3)
# DuckDealerDF$name<-"DuckDealer"
# DuckDealerDF <- DuckDealerDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(DuckDealerXML,DuckDealerLS,DuckDealerLS2,DuckDealerLS3)
# 
# 
# # #FCM stats
# FCMXML<-xmlParse("FCM.xml", useInternalNodes = TRUE)
#  FCMLS<-xmlToList(FCMXML)
#  FCMLS2<-FCMLS$item
#  FCMLS3<-FCMLS2$statistics
# FCMDF<-data.frame(FCMLS3)
# FCMDF$name<-"FCM"
# FCMDF <- FCMDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(FCMXML,FCMLS,FCMLS2,FCMLS3)
# 
# 
# 
# #Gossip stats
# GossipXML<-xmlParse("Gossip.xml", useInternalNodes = TRUE)
# GossipLS<-xmlToList(GossipXML)
# GossipLS2<-GossipLS$item
# GossipLS3<-GossipLS2$statistics
# GossipDF<-data.frame(GossipLS3)
# GossipDF$name<-"Gossip"
# GossipDF <- GossipDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(GossipXML,GossipLS,GossipLS2,GossipLS3)
# 
# 
# 
# #GreedInc stats
# GreedIncXML<-xmlParse("GreedInc.xml", useInternalNodes = TRUE)
# GreedIncLS<-xmlToList(GreedIncXML)
# GreedIncLS2<-GreedIncLS$item
# GreedIncLS3<-GreedIncLS2$statistics
# GreedIncDF<-data.frame(GreedIncLS3)
# GreedIncDF$name<-"GreedInc"
# GreedIncDF <- GreedIncDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(GreedIncXML,GreedIncLS,GreedIncLS2,GreedIncLS3)
# 
# 
# #HC stats
# HCXML<-xmlParse("HC.xml", useInternalNodes = TRUE)
# HCLS<-xmlToList(HCXML)
# HCLS2<-HCLS$item
# HCLS3<-HCLS2$statistics
# HCDF<-data.frame(HCLS3)
# HCDF$name<-"HorselessCarriage"
# HCDF <- HCDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(HCXML,HCLS,HCLS2,HCLS3)
# 
# 
# #Indonesia stats
# IndonesiaXML<-xmlParse("Indonesia.xml", useInternalNodes = TRUE)
# IndonesiaLS<-xmlToList(IndonesiaXML)
# IndonesiaLS2<-IndonesiaLS$item
# IndonesiaLS3<-IndonesiaLS2$statistics
# IndonesiaDF<-data.frame(IndonesiaLS3)
# IndonesiaDF$name<-"Indonesia"
# IndonesiaDF <- IndonesiaDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(IndonesiaXML,IndonesiaLS,IndonesiaLS2,IndonesiaLS3)
# 
# 
# #Kiek stats
# KiekXML<-xmlParse("Kiek.xml", useInternalNodes = TRUE)
# KiekLS<-xmlToList(KiekXML)
# KiekLS2<-KiekLS$item
# KiekLS3<-KiekLS2$statistics
# KiekDF<-data.frame(KiekLS3)
# KiekDF$name<-"Kiek"
# KiekDF <- KiekDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(KiekXML,KiekLS,KiekLS2,KiekLS3)
# 
# 
# 
# #Oraklos stats
# OraklosXML<-xmlParse("Oraklos.xml", useInternalNodes = TRUE)
# OraklosLS<-xmlToList(OraklosXML)
# OraklosLS2<-OraklosLS$item
# OraklosLS3<-OraklosLS2$statistics
# OraklosDF<-data.frame(OraklosLS3)
# OraklosDF$name<-"Oraklos"
# OraklosDF <- OraklosDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(OraklosXML,OraklosLS,OraklosLS2,OraklosLS3)
# 
# 
# #RoadsnBoats stats
# RoadsnBoatsXML<-xmlParse("RoadsnBoats.xml", useInternalNodes = TRUE)
# RoadsnBoatsLS<-xmlToList(RoadsnBoatsXML)
# RoadsnBoatsLS2<-RoadsnBoatsLS$item
# RoadsnBoatsLS3<-RoadsnBoatsLS2$statistics
# RoadsnBoatsDF<-data.frame(RoadsnBoatsLS3)
# RoadsnBoatsDF$name<-"RoadsnBoats"
# RoadsnBoatsDF <- RoadsnBoatsDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(RoadsnBoatsXML,RoadsnBoatsLS,,RoadsnBoatsLS2,RoadsnBoatsLS3)
# 
# 
# #The Great Zimbabwe stats
# TGZXML<-xmlParse("The Great Zimbabwe.xml", useInternalNodes = TRUE)
# TGZLS<-xmlToList(TGZXML)
# TGZLS2<-TGZLS$item
# TGZLS3<-TGZLS2$statistics
# TGZDF<-data.frame(TGZLS3)
# TGZDF$name<-"The Great Zimbabwe"
# TGZDF <- TGZDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(TGZXML,TGZLS,TGZLS2,TGZLS3)
# 
# 
# 
# #UR stats
# URXML<-xmlParse("UR.xml", useInternalNodes = TRUE)
# URLS<-xmlToList(URXML)
# URLS2<-URLS$item
# URLS3<-URLS2$statistics
# URDF<-data.frame(URLS3)
# URDF$name<-"UR 1830 BC"
# URDF <- URDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned,ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(URXML,URLS,URLS,URLS2,URLS3)
# 
# 
# #VOC stats
# VOCXML<-xmlParse("VOC.xml", useInternalNodes = TRUE)
# VOCLS<-xmlToList(VOCXML)
# VOCLS2<-VOCLS$item
# VOCLS3<-VOCLS2$statistics
# VOCDF<-data.frame(VOCLS3)
# VOCDF$name<-"VOC"
# VOCDF <- VOCDF %>%
#   distinct(name, .keep_all=TRUE)%>%
#   select(ratings.average,ratings.stddev,ratings.owned, ratings.averageweight,ratings.numweights, name)
# #Removing items that are no longer needed to keep a tidy environment
# rm(VOCXML,VOCLS,VOCLS2,VOCLS3)
# 
# #Rbinding all game dataframes together to create one overall splottergame dataframe
# Splottergames<-rbind(AntiquityDF,
#                      BeestDF,
#                      BUSDF,
#                      CannesDF,
#                      DrafDF,
#                      DuckDealerDF,
#                      FCMDF,
#                      GossipDF,
#                      GreedIncDF,
#                      HCDF,
#                      IndonesiaDF,
#                      KiekDF,
#                      OraklosDF,
#                      RoadsnBoatsDF,
#                      TGZDF,
#                      URDF,
#                      VOCDF
#                      )
# #Save the dataframe so we can add bits not typically saved in the avi
# write.csv(Splottergames, "Splottergames.csv")


#####Reading in dataframe with all splotter games/info#####
#Read in dataframe
Splottergames<-read.csv("Splottergames.csv")
#View the dataframe
View(Splottergames)
#####Renaming columns of dataframe####
Splottergames1<-Splottergames %>%
  select(-ID) %>%
  rename(AverageRating = ratings.average, 
         StdDevRatings = ratings.stddev, 
         Ownedcopies = ratings.owned,
         Weight = ratings.averageweight,
         numberofweights = ratings.numweights
         )

#####Calculating the average rating of splottergames####
#Mean is 6.656 ranking
mean(Splottergames1$AverageRating)
#Meadian is 6.78
median(Splottergames1$AverageRating)

##### Calculating the total number of copies reported owned on BGG#####
#There are a total of 58,093 reported copies of splotter games owned by BGG users
sum(Splottergames1$Ownedcopies)

#####Calculating the average weight of splotter games on bgg####
#Average weight of 3.581
median(Splottergames1$Weight)

#####Calculating the number of recorded plays by BGG users#####
#Sum of total reported plays of BGG users is 111,052 
sum(Splottergames1$Plays)

#####Total number of games in the top 500 ranked games on bgg####
#10/17 games in the top 500 on bgg
Splottergames2<-Splottergames1 %>%
  filter(ranking < 500)
nrow(Splottergames2)
