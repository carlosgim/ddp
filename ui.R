library(shiny)
shinyUI(fluidPage(
  titlePanel("Interactive fit line"),
  sidebarLayout(
    sidebarPanel(
        p("Select with the mouse the area of fit"),
    	h3("Slope"),
    	textOutput("slopeOut"),
    	h3("Intercept"),
    	textOutput("intOut"),
    	h3("App Inputs"),
    numericInput("numeric", "Choose the kind of shape ponts",
                 value  = 1, min = 1, max = 5, step = 1),
    numericInput("numeric2", "Choose the size of points",
                 value  = 1, min = 1, max = 5, step = 1),
    numericInput("color", "Choose Color",
                 value  = 1, min = 1, max = 10, step = 1),
    checkboxInput("show_xlab", "Show/Hide X Axis Label", value = TRUE),
    checkboxInput("show_ylab", "Show/Hide Y Axis Label", value = TRUE),
    checkboxInput("show_title", "Show/Hide Title")
    ),
    mainPanel(
      plotOutput("plot1", brush = brushOpts(
        id = "brush1"
      ))
    )
  )
))