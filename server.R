library(shiny)
data <- read.csv(unz('./data/IPPS_FY2011.csv.zip', 'IPPS_FY2011.csv'))
data$Average.Covered.Charges <- as.numeric(data$Average.Covered.Charges)
data$Average.Total.Payments <- as.numeric(data$Average.Total.Payments)

shinyServer(function(input, output) {
    
    output$hist_charge_plot <- renderPlot({
        
        hist(
             Average.Covered.Charges,
             data = data[data$DRG.Definition == input$drg & data$Provider.State == input$state,],
             breaks = 100,
             xlab = "Charge Amount",
             main = "Average Charge Amount")
        
    })
})