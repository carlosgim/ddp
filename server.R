library(shiny)
shinyServer(function(input, output) {
  model <- reactive({
    brushed_data <- brushedPoints(trees, input$brush1,
                            xvar = "Girth", yvar = "Volume")
    if(nrow(brushed_data) < 2){
      return(NULL)
    }
    lm(Volume ~ Girth, data = brushed_data)
  })
  
  output$slopeOut <- renderText({
    if(is.null(model())){
      "No Model Found"
    } else {
      model()[[1]][2]
    }
  })
  
  output$intOut <- renderText({
    if(is.null(model())){
      "No Model Found"
    } else {
      model()[[1]][1]
    }
  })
  
  output$plot1 <- renderPlot({
    kinddot <- input$numeric
    sizedot <- input$numeric2
    col <- input$color
    xlab <- ifelse(input$show_xlab, "Girth", "")
    ylab <- ifelse(input$show_ylab, "Volume", "")
    maint <- ifelse(input$show_title, "Fit Interactive", "")
    plot(trees$Girth, trees$Volume,
         cex =  sizedot, pch = kinddot, bty = "n", main = maint,
         xlab = xlab, ylab = ylab, col=col)
    if(!is.null(model())){
      abline(model(), col = "blue", lwd = 2)
    }
  })
  
  
})