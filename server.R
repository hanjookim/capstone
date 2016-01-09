library(shiny) 
library(tm) 
library(stringr) 
#library(RWeka) 
#library(wordcloud) # for wordcloud 
#library(tm) 
library(NLP) 
#library(ngram) # for n-grams model 
#library(qdap) # count word 
library(caroline) # plot text only plot 
#devtools::install_github('rstudio/shiny') 

df_unigram<-read.csv("C:/My Documents/Company Work/LA County/Capstone/uni.csv") 
df_bigram<-read.csv("C:/My Documents/Company Work/LA County/Capstone/bi.csv") 
df_trigram<-read.csv("C:/My Documents/Company Work/LA County/Capstone/tri.csv") 
df_quagram<-read.csv("C:/My Documents/Company Work/LA County/Capstone/qua.csv") 

# add prediction function : (bigram, trigram, and quagram) 
source("C:/My Documents/Company Work/LA County/Capstone/model_wordcloud.R") 

#create a funtion that can use to identify radiobutton while do the prediction:  
nextword<-function(radiobutton, inputText,input){ 
if (input$radiobutton=="bi"){ 
predict_bi(input$text) 
}else if(input$radiobutton=="tri"){ 
predict_tri(input$text) 
}else if(input$radiobutton=="qua"){ 
predict_qua(input$text) 
} 
} 

shinyServer(function(input, output,session) { 
radiobutton<-reactive({input$radiobutton}) 
inputText<-reactive({input$text}) 
output$textout<-renderTable({ 
predictions<-nextword(radiobutton(),inputText,input) 
df<-data.frame(predictions) 
msg<-NULL 
for (i in 1:nrow(df)) { 
prediction<-paste0("TOP #", i, " prediction is: ", df[i,1], sep="", collapse="") 
msg<-rbind(msg, as.data.frame(prediction)) 
} 
return(msg) 
}, quoted=FALSE) 
withProgress(message = 'Predicting in progress...', value = NULL, { 
Sys.sleep(0.25) 
dat <- data.frame(x = numeric(0), y = numeric(0)) 
withProgress(message = 'App is running, one moment please', detail = "part 0", value = 0, { 
for (i in 1:10) { 
dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1))) 
incProgress(0.1, detail = paste(":", i*10,"%")) 
Sys.sleep(0.5) 
} 
}) 
incProgress(0.5) 
}) 
})
