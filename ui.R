library(shiny)

shinyUI(
    
    pageWithSidebar(
        
        headerPanel("Simple diabetes predict"),
        
        sidebarPanel(
            numericInput(
                'glucose', # id
                'Glucose mg/dl', # label
                88, # default value
                min = 50,
                max = 200,
                step = 2
            ),
            submitButton("Go predict")
            #h3("Sidebar text"),
            #h3("two ANother one"),
            #h3("three ANother one"),
            #h3("four ANother one")
        
            
        ),

        mainPanel(
            h3("Your results"),
            h4("You entered: "),
            verbatimTextOutput("inputValue"),
            h4("which resulted in a prediction of: "),
            verbatimTextOutput("prediction"),
            plotOutput('newHist')
        )
        
    )
    
)