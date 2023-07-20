

# Use a fluid Bootstrap layout
fluidPage(    
  
  # Give the page a title
  titlePanel("Kansas Population and Crime Bar Chart Comparisons"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("County", "County:", 
                  choices=colnames(kansaspop)),
      hr(),
      helpText("Data from Kansas Counties Population and Crime")
    ),
    
    # Create a spot for the population barplot
    mainPanel(
      plotOutput("countyPopPlot"), 
      tableOutput("countyPopTable"),
      plotOutput("countyCrimePlot"),
      tableOutput("countyCrimeTable")
    )
    

  )
)
