# Shiny app

library(shiny)

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
           textInput("text", label = , "Enter three numbers, seperated by commas", value = "2, 4, 6")
    )
  ),
  fluidRow(
    column(width = 9,
           h2("Results"),
           textOutput("value")
    )
  )
)

server <- function(input, output) {
  
  output$value <- renderPrint({ input$text })
}

shinyApp(ui = ui, server = server)