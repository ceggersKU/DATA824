###Prep data for Shiny App

#install and load packages
install.packages('xlsx')     
library(xlsx)        
library(tidyr)
library(readr)

#Import data

KansasPopulation <- read_csv("Final Project/KansasPopulation.csv")
View(KansasPopulation)

KansasCrimeWide <- read_excel("Final Project/KansasCrimeWide.xlsx")
View(KansasCrimeWide)


##########################

#Convert Kansas Pop to wide format and other prep
kansaspop <- KansasPopulation %>% 
  tidyr::pivot_wider(names_from = County, values_from = Population)

  #removed the first column
  kansaspop <- subset( kansaspop, select = -1)

  #changed to a data frame!!!!!!!! This fixed my issue with heigh
  kansaspop <- data.frame(kansaspop)

  #assign row names
  rownames(kansaspop) <- kansaspop[,1]

  #remove first column
  kansaspop <- subset( kansaspop, select = -1)
  
  #remove 1st (2010), 2nd (2011), and 4th row (2018) to line up with crime data
  kansaspop <- kansaspop[-c(1, 2, 9), ]
  

#Prep Kansas crime data
  #changed to a data frame!!!!!!!! This fixed my issue with heigh
  kansascrime <- data.frame(KansasCrimeWide)

  #assign row names
  rownames(kansascrime) <- kansascrime[,1]
  
  #remove first column
  kansascrime <- subset( kansascrime, select = -1)



