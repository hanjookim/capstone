setwd("C:/My Documents/Company Work/LA County/Capstone")

install.packages('devtools')
library(devtools)

devtools::install_github('rstudio/rsconnect')

library(rsconnect)
rsconnect::setAccountInfo(name='hanjookim', token='1E07B3D85AA0B37F0786F924385C1763', secret='NvJtWePzKvsxYvMQSGD09X8ufBK7arh175htzGOo')

install.packages("shiny")
library(shiny)
library(shinyapps)

options(shinyapps.locale.cache=FALSE)
shinyapps::deployApp('C:/My Documents/Company Work/LA County/Capstone')

runApp()
deployApp(appName="capstone")

