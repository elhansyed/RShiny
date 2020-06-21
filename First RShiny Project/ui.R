shinyUI(
  pageWithSidebar(
    headerPanel("Learning RShiny"),
    sidebarPanel(
      selectInput("distribution", 
                  "Select Distribution Type",
                  choices = c("Normal", "Exponential", "Beta")),
      
      sliderInput("sampleSize", 
                  "Select a Sample Size",
                  min = 30, max = 1000, value = 500, step = 100),
      
      conditionalPanel(condition = "input.distribution == 'Normal'",
                       textInput("mean", "Input Mean", 10),
                       textInput("sd", "Input Standard Deviation", 2)),
      
      conditionalPanel(condition = "input.distribution == 'Exponential'",
                       textInput("lambda", "Input Lambda", 3)),
      
      conditionalPanel(condition = "input.distribution == 'Beta'",
                       textInput("alpha", "Input Alpha", 3),
                       textInput("beta", "Input Beta", 3))
      
    ),
    mainPanel(
      plotOutput("myPlot")
    )
  )
  
  
  
)