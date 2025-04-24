library(shiny)

shinyServer(
  function(input, output){
    
    # LEAF
    
    output$plot_leaf <- renderPlot({
      
      req(input$n0)
      
      n = input$n0
      
      i = 1
      
      numbers <- c()
      
      while(i <= n){
        numbers[i] = floor(runif(n = 1, min = 1, max = 5))
        
        i = i + 1
      }
      
      x <- c(0)
      y <- c(0)
      
      i = 2
      
      while (i <= n+1){
        if(numbers[i-1] == 1)
        {
          x[i] <- ( (0.8 * x[i-1]) + 0.1 )
          y[i] <- ( (0.8 * y[i-1]) + 0.04 )
        }
        else if(numbers[i-1] == 2)
        {
          x[i] <- ( (0.5 * x[i-1]) + 0.25 )
          y[i] <- ( (0.5 * y[i-1]) + 0.4 )
        }
        else if(numbers[i-1] == 3)
        {
          x[i] <- ( (0.355 * (x[i-1] - y[i-1])) + 0.266 )
          y[i] <- ( (0.355 * (x[i-1] + y[i-1])) + 0.078 )
        }
        else if(numbers[i-1] == 4)
        {
          x[i] <- ( (0.355 * (x[i-1] + y[i-1])) + 0.378 )
          y[i] <- ( (0.355 * (y[i-1] - x[i-1])) + 0.434 )
        }
        
        i = i + 1
      }
      
      
      par(bg = "black")
      plot(x, y, pch= ".", col = "green", axes = FALSE)
    })
    
    
    # FERN 1
    
    output$plot_fern_1 <- renderPlot({
      
      req(input$n1)
      
      iterations <- input$n1
      
      x <- numeric(iterations)
      y <- numeric(iterations)
      
      x[1] <- 0
      y[1] <- 0
      
      for (i in 2:iterations) {
        r <- runif(1)
        
        if (r <= 0.01) {
          x[i] <- 0
          y[i] <- 0.16 * y[i-1]
        } else if (r <= 0.86) {
          x[i] <- 0.85 * x[i-1] + 0.04 * y[i-1]
          y[i] <- -0.04 * x[i-1] + 0.85 * y[i-1] + 1.6
        } else if (r <= 0.93) {
          x[i] <- 0.2 * x[i-1] - 0.26 * y[i-1]
          y[i] <- 0.23 * x[i-1] + 0.22 * y[i-1] + 1.6
        } else {
          x[i] <- -0.15 * x[i-1] + 0.28 * y[i-1]
          y[i] <- 0.26 * x[i-1] + 0.24 * y[i-1] + 0.44
        }
      }
      
      
      par(bg = "black")
      plot(x, y, pch= ".", col = "green", axes = FALSE)
      
    })
    
    
    # FERN 2
    
    output$plot_fern_2 <- renderPlot({
      
      req(input$n2)
      
      n = input$n2
      
      x <- c(0)
      y <- c(0)
      
      i = 2
      
      while (i <= n) {
        num <- runif(1)
        
        if(num <= 0.01){
          x[i] <- 0
          y[i] <- 0.16 * y[i-1]
        }else if(num <= 0.86){
          x[i] <- 0.85 * x[i-1] - 0.04 * y[i-1]
          # x[i] <- 0.85 * x[i-1] + 0.04 * y[i-1]
          y[i] <- -0.04 * x[i-1] + 0.85 * y[i-1] + 1.6
        }else if(num <= 0.93){
          x[i] <- 0.2 * x[i-1] - 0.26 * y[i-1]
          y[i] <- 0.23 * x[i-1] + 0.22 * y[i-1] + 1.6
        }else{
          x[i] <-  -0.15 * x[i-1]  + 0.28 * y[i-1]
          y[i] <- 0.26 * x[i-1] + 0.24 * y[i-1] + 0.44
        }
        
        i = i + 1
      }
      
      par(bg = "black")
      plot(x, y,
           col = "green", 
           pch = ".",
           axes = FALSE)
      
    })
    
    # FERN 3
    
    output$plot_fern_3 <- renderPlot({
      
      req(input$n3)
      
      n = input$n3
      
      x <- c(0)
      y <- c(0)
      
      i = 2
      
      while (i <= n) {
        num <- runif(1)
        
        if(num <= 0.02){
          x[i] <- 0
          y[i] <- 0.25 * y[i-1]
        }else if(num <= 0.86){
          x[i] <- 0.95 * x[i-1] + 0.005 * y[i-1] - 0.002
          y[i] <- -0.005 * x[i-1] + 0.93 * y[i-1] + 0.5
        }else if(num <= 0.93){
          x[i] <- 0.035 * x[i-1] - 0.2 * y[i-1] - 0.09
          y[i] <- 0.16 * x[i-1] + 0.04 * y[i-1] + 0.02
        }else{
          x[i] <-  -0.04 * x[i-1]  + 0.2 * y[i-1] + 0.083
          y[i] <- 0.16 * x[i-1] + 0.04 * y[i-1] + 0.12
        }
        
        i = i + 1
      }
      
      par(bg = "black")
      plot(x, y,
           col = "green", 
           pch = ".",
           axes = FALSE)
      
    })
    
    
    # FERN 4
    
    output$plot_fern_4 <- renderPlot({
      
      req(input$n4)
      
      # modification given by Thomas and Banks - as per ChatGPT
      n = input$n4
      
      x <- c(0)
      y <- c(0)
      
      i = 2
      
      while (i <= n) {
        num <- runif(1)
        
        if(num <= 0.01){
          x[i] <- 0
          y[i] <- 0.16 * y[i-1]
        }else if(num <= 0.86){
          x[i] <- 0.87 * x[i-1] - 0.04 * y[i-1]
          y[i] <- 0.04 * x[i-1] + 0.85 * y[i-1] + 1.6
        }else if(num <= 0.93){
          x[i] <- 0.2 * x[i-1] - 0.26 * y[i-1]
          y[i] <- 0.23 * x[i-1] + 0.22 * y[i-1] + 1.6
        }else{
          x[i] <-  -0.15 * x[i-1]  + 0.28 * y[i-1]
          y[i] <- 0.26 * x[i-1] + 0.24 * y[i-1] + 0.44
        }
        
        i = i + 1
      }
      
      par(bg = "black")
      plot(x, y,
           col = "green", 
           pch = ".",
           axes = FALSE)
      
    })
    
    
    
    # More FERNs
    
    output$more_ferns <- renderPlot({
      
      iterations <- 100000
      
      x <- numeric(iterations)
      y <- numeric(iterations)
      
      x[1] <- 0
      y[1] <- 0
      
      tau <- input$tau
      
      for (i in 2:iterations) {
        r <- runif(1)
        
        if (r <= 0.01) {
          x[i] <- 0
          y[i] <- 0.16 * y[i-1]
        } else if (r <= 0.86) {
          x[i] <- 0.85 * x[i-1] + tau * y[i-1]
          y[i] <- -0.04 * x[i-1] + 0.85 * y[i-1] + 1.6
        } else if (r <= 0.93) {
          x[i] <- 0.2 * x[i-1] - 0.26 * y[i-1]
          y[i] <- 0.23 * x[i-1] + 0.22 * y[i-1] + 1.6
        } else {
          x[i] <- -0.15 * x[i-1] + 0.28 * y[i-1]
          y[i] <- 0.26 * x[i-1] + 0.24 * y[i-1] + 0.44
        }
      }
      
      
      par(bg = "black")
      plot(x, y, pch= ".", col = "green", axes = FALSE)
      
    })
  }
)