# Shiny app

library(shiny)

ui <- fluidPage(
  
  titlePanel("A simple test"),
  
  sidebarLayout(
    
    sidebarPanel(
      p("I am thinking of a ", strong("sequence of three numbers."), "These 
      numbers follow a ", strong("specific, simple rule. "), "I would like 
      you to ", strong("guess the rule. "), "To help you guess, I'll let you 
      submit your own sequence of three numbers. I'll let you know if your 
      submitted sequence follows the rule I'm thinking of or not. You may 
      submit as many sequences as you wish. When you believe that you
      have found the rule, write out your guess in the bottom text box
      and submit it."),
      p("An example of a sequence that follows the rule is: ", em("2, 4, 6"))
    ),
    
    mainPanel(
      
      h3("Enter a sequence here"),
      p("Enter a sequence of three numbers and press the button. You'll get 
        feedback on whether your sequence follows the rule or not."),
      textInput("text", label = "Enter three numbers, seperated by commas", value = "2, 4, 6"),
      actionButton("do", label = "Check"),
      
      h2("Results"),
      p('"TRUE" means that your sequence matches the rule. "FALSE" means 
        that it does not.'),
      textOutput("value"),
      
      h2("Think you know the answer?"),
      p("When you believe that you know the rule that the sequence follows, 
          you may submit it here. 
          Note that you can only do it ONCE, so make sure you're satisfied 
          with you answer before attempting. 
          You don't have to worry about exact phrasing."),
      textInput("rule_answer", label = "What is the rule that these three numbers follow?"),
      actionButton("rule_given", label = "Submit"),
      textOutput("true_rule")
    )
  )
)

server <- function(input, output) {
  
  # Reacts when button is pressed
  out <- eventReactive(input$do, {
    input$text %>% 
      run_test()
  })
  
  # Sends results to the ui.
  output$value <- renderText({
    out()
  })
  
  # Makes the given rule reactive.
  rule_in <- eventReactive(input$rule_given, {
    input$rule_answer
  })
  
  # Initiates rule explanation when button is pressed
  rule_out <- eventReactive(input$rule_given, {
    return('"Any numbers in ascending order"')
  })
  
  # Prints the true rule (line break not possible in renderText).
  output$true_rule <- renderText({
    paste0('The real rule is: ', rule_out(),
          ". Did you get it right?")
  })
  
}

shinyApp(ui = ui, server = server)