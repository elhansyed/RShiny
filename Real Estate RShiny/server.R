shinyServer(
  function(input, output, session){
    real_data = read.csv("~/R Projects/Real Estate RShiny/reale_a3data (1).csv")
    
    output$myPlot = renderPlot({
      X = as.name(input$indVar)
      Y = as.name(input$depVar)
      
      locationDep_real_data = real_data
      
      if(input$locationX & input$locationO) {
        locationDep_real_data = real_data
      }
      else if(input$locationX) {
        locationDep_real_data = real_data[real_data$location == "X",]
      }
      else if(input$locationO){
        locationDep_real_data = real_data[real_data$location == "O",]
      }
      
      plot(locationDep_real_data[[X]], locationDep_real_data[[Y]], xlab = X, ylab = Y)
      abline(lsfit(locationDep_real_data[[X]], locationDep_real_data[[Y]]), col="red")
      
      mod = lm(locationDep_real_data[[Y]]~locationDep_real_data[[X]])

      mod_sum = summary(mod)

      eqn <<- paste("y = ", round(mod_sum$coefficients[2],3), "x + ", round(mod_sum$coefficients[1],3), sep= "")
      R2 <<- paste("R2 = ", round(mod_sum$r.squared,3), sep="")
      pval <<- paste("p = ", round(mod_sum$coefficients[2, 4], 5), sep="")
     })
    
    observeEvent(input$indVar, {output$eqn = renderText({eqn})})
    observeEvent(input$indVar,{output$R2 = renderText({R2})})
    observeEvent(input$indVar,{output$p = renderText({pval})})
    
    observeEvent(input$depVar, {output$eqn = renderText({eqn})})
    observeEvent(input$depVar,{output$R2 = renderText({R2})})
    observeEvent(input$depVar,{output$p = renderText({pval})})
    
  }
  
)