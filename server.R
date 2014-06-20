library(shiny)

shinyServer(function(input, output) {
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
                xlab = '',
                ylab = as.character(input$metric),
                main = paste0('Average ', as.character(input$metric),
                              ' for ', as.character(input$state1)))
        boxplot(us.data[metric],
                xlab = '',
                ylab = as.character(input$metric),
                main = paste0('National Average ', as.character(input$metric)))
        boxplot(state2.data[metric],
                xlab = '',
                ylab = as.character(input$metric),
                main = paste0('Average ', as.character(input$metric),
                              ' for ', as.character(input$state2))) 
    })
    
})