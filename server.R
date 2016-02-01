
require(shiny)
require(ggplot2)
require(caret)
data("diamonds")


inTrain <- createDataPartition(y = diamonds$price, p = 0.7, list = FALSE)
training <- diamonds[inTrain,]
testing <- diamonds[-inTrain,]


training$price_log <- log(training$price)
testing$price_log <- log(testing$price)

lm2 <- lm(price_log ~ carat, data = training)

pricingDiamond <- function(carat) {

    newdata <- data.frame(carat = carat)
    signif(exp(predict(lm2, newdata)))
    
}

#diabetesRisk <- function(glucose) glucose / 200

shinyServer(
    
    function(input, output) {
        
        output$inputValue <- renderUI({ 
            HTML(paste("It has <b>", input$carat, "</b> carats"))
        })
        
        
        #output$inputValue <- renderPrint({input$carat})
        #output$prediction <- renderPrint({pricingDiamond(input$carat)})
        output$prediction <- renderUI({ 
            HTML(paste("$ ", {pricingDiamond(input$carat)}))
        })
        
    }
    
)