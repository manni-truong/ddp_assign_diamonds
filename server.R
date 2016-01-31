
library(shiny)
data("diamonds")


diabetesRisk <- function(glucose) glucose / 200

shinyServer(
    
    function(input, output) {
        
        #output <- input$glucose / 200
        
        output$inputValue <- renderPrint({input$glucose})
        output$prediction <- renderPrint({diabetesRisk(input$glucose)})
        
        
    }
    
)