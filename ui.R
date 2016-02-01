require(shiny)

shinyUI(
    
    pageWithSidebar(
        
        headerPanel("Linear diamond pricing model"),
        
        sidebarPanel(
            numericInput(
                'carat', # id
                'Carat', # label
                0.79, # default value
                min = 0.01,
                max = 10,
                step = 0.01
            ),
            submitButton("Price diamond")

        
            
        ),

        mainPanel(
            h3("Diamond price"),
            h4("How many carats does your diamond have? "),
            #verbatimTextOutput("inputValue"),
            htmlOutput("inputValue"), 
            h4("Your diamond is worth: "),
            #verbatimTextOutput("prediction")
            htmlOutput("prediction"),
            
            h4("How to use:"),
            helpText("This apps helps friends of diamonds to figure out how much his or her piece of jewellery is worth given they know the carat number. It uses a dataset of about 37k observations to train a linear model that can predict the price."),
            code("Carat"),
            helpText("This will determine the price of a diamond."),
            code("Price"),
            helpText("Enter the carat number to get an estimate of the price of a diamond."),
            
            h4("Background"),
            helpText("To understand how the model was built check out the readme in the ",  a("github repo.", href="http://github.com/manni-truong", target="_blank"))
            
        )
        
    )
    
)