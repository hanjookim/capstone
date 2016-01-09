install.packages("devtools")
library(devtools)

install_github('slidify', 'ramnathv')
install_github('slidifyLibraries', 'ramnathv')

library(slidify)

setwd("C:/My Documents/Company Work/LA County/Capstone")

author("capstone")

publish_github('hanjookim', 'capstone')
