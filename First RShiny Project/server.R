shinyServer(
  function(input, output, session){
    output$myPlot = renderPlot({
      
      distrType = input$distribution
      size = input$sampleSize
      
      if(distrType == "Normal"){
        sample = rnorm(size, mean = as.numeric(input$mean), sd = as.numeric(input$sd))
      }
      else if(distrType == "Beta"){
        sample = rbeta(size, as.numeric(input$alpha), as.numeric(input$beta))
      }
      else{
        sample = rexp(size, 1/as.numeric(input$lambda))
      }
      
      hist(sample, col = "red", freq = TRUE, main = NULL)
      
    })
  }
  
  
  )