library(shiny)

data <- read.csv(unz('./data/IPPS_FY2011.csv.zip', 'IPPS_FY2011.csv'))
data$Average.Covered.Charges <- as.numeric(data$Average.Covered.Charges)
data$Average.Total.Payments <- as.numeric(data$Average.Total.Payments)
data$Average.Medicare.Payments <- as.numeric(data$Average.Medicare.Payments)

shinyServer(function(input, output) {
    
    output$box_average_charge_plot <- renderPlot({
        
        state1.data <- data[data$DRG.Definition == input$drg & data$Provider.State == input$state1,]
        state2.data <- data[data$DRG.Definition == input$drg & data$Provider.State == input$state2,]
        us.data <- data[data$DRG.Definition == input$drg,]
        
        par(mfrow=c(1,3))
        boxplot(state1.data$Average.Covered.Charges,
                xlab = as.character(input$state1),
                ylab = 'Charge Amount',
                main = 'Average Charges for this DRG')
        boxplot(us.data$Average.Covered.Charges,
                xlab = 'US',
                ylab = 'Charge Amount',
                main = 'National Average Charges for this DRG')
        boxplot(state2.data$Average.Covered.Charges,
                xlab = as.character(input$state2),
                ylab = 'Charge Amount',
                main = 'Average Charges for this DRG') 
    })
    
    output$box_plot <- renderPlot({
        
        state1.data <- data[data$DRG.Definition == input$drg & data$Provider.State == input$state1,]
        state2.data <- data[data$DRG.Definition == input$drg & data$Provider.State == input$state2,]
        us.data <- data[data$DRG.Definition == input$drg,]
        if (as.character(input$metric) == 'Charges'){
            metric <- 'Average.Covered.Charges'
        }
        else if (as.character(input$metric) == 'Payments'){
            metric <- 'Average.Total.Payments'
        }
        else {
            metric <- 'Average.Medicare.Payments'
        }
        
        par(mfrow=c(1,3))
        boxplot(state1.data[metric],
                xlab = as.character(input$state1),
                ylab = 'Charge Amount',
                main = paste0('Average ', as.character(input$metric),
                              ' for\n', as.character(input$drg)))
        boxplot(us.data[metric],
                xlab = 'US',
                ylab = 'Charge Amount',
                main = paste0('National Average ', as.character(input$metric), 
                              ' for\n', as.character(input$drg)))
        boxplot(state2.data[metric],
                xlab = as.character(input$state2),
                ylab = 'Charge Amount',
                main = paste0('Average ', as.character(input$metric),
                              ' for\n', as.character(input$drg))) 
    })
    
})