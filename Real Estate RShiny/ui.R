library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("Linear Models of Real Estate Data"),
    sidebarPanel(
      selectInput("indVar", 
                  "Independent Variable (X)",
                  choices = c("Sale", 
                              "list", 
                              "taxes")),
      
      selectInput("depVar", 
                  "Dependent Variable (Y)",
                  choices = c("list", 
                              "Sale",
                              "taxes")),
      
      tags$strong("Locations"),
      
      checkboxInput("locationX","Location X", value = TRUE),
      
      checkboxInput("locationO", "Location O", value = TRUE)
      
    ),
    
    mainPanel(
      plotOutput("myPlot"), 
      textOutput("eqn"),
      textOutput("R2"),
      textOutput("p")
    )
  )
  
)