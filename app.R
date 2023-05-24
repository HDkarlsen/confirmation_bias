# Shiny app

library(shiny)

source("functions.R")

ui <- fluidPage(
  
  titlePanel("A simple test"),
  
  fluidRow(
    column(width = 6, 
           p("I am thinking of a sequence of three numbers. These numbers follow a specific, simple rule. I would like you to guess 
      the rule. To help you guess, I'll let you submit your own sequence of three numbers. I'll let you know if your submitted
      sequence follows the rule I'm thinking of or not. You may submit as many sequences as you wish. When you believe that you
      have found the rule, let me know and I'll give you the answer.")
    ),
    column(width = 4,
           h3("Enter numbers here"),
           textInput("text", label = "Enter three numbers, seperated by commas", value = "2, 4, 6"),
           actionButton("do", label = "Check")
    )
  ),
  fluidRow(
    column(width = 7,
           h2("Results"),
           textOutput("value")
    ),
    column(width = 3,
           h2("Think you know the answer?"),
           p("When you believe that you know the rule that the sequence follows, you may submit it here. 
             Note that you can only do it ONCE, so make sure you're satisfied with you answer before attempting. 
             You don't have to worry about exact phrasing."),
           textInput("rule_answer", label = "What is the rule that these three numbers follow?"),
           actionButton("rule_given", label = "Submit"),
           textOutput("true_rule")
           )
  )
)

server <- function(input, output) {
  
  # Initialises rule_out for later (might not be necessary).
  rule_out <- ""
  
  # Reacts when button is pressed
  out <- eventReactive(input$do, {
    input$text %>% 
      run_test()
  })
  
  # Sends results to the ui.
  output$value <- renderPrint({
    out()
  })
  
  # Initiates rule explanation when button is pressed
  rule_out <- eventReactive(input$rule_given, {
    return('"Any numbers in ascending order"')
  })
  
  # I'd like a linebreak. 
  output$true_rule <- renderText({
    paste0('You said: "', input$rule_answer,  '"--- \n The real rule is: ', rule_out(),
          ". Did you get it right?")
  })
  
}

shinyApp(ui = ui, server = server)