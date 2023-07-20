

# Define a server for the Shiny app
function(input, output) {
  
  # Fill in the spot we created for a plot
  output$countyPopPlot <- renderPlot({
    
    # Render a barplot
    barplot(kansaspop[,input$County]/1000, #to rep as 000s of population
            main=input$County,
            ylab="Population Total in 000s",
            xlab="Year",
            names.arg=row.names(kansaspop),
            #ylim = c(0,500),
            col = c("darkgrey", "lightgrey"))
  })
  
  # Fill in the spot we created for a plot
  output$countyPopTable <- renderTable(kansaspop[,input$County] 
                                         ,rownames = TRUE)
  
  # Fill in the spot we created for a plot
  output$countyCrimePlot <- renderPlot({
    
    # Render a barplot
    barplot(kansascrime[,input$County],
            main=input$County,
            ylab="Crime Total",
            xlab="Year",
            names.arg=row.names(kansascrime),
            ylim = c(0,10),
            col = c("lightgrey", "darkgrey"))
  })
  
  # Fill in the spot we created for a table
  output$countyCrimeTable <- renderTable(kansascrime[,input$County] 
                                         ,rownames = TRUE)
    
    
}


