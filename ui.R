library(shiny)
data <- read.csv(unz('./data/IPPS_FY2011.csv.zip', 'IPPS_FY2011.csv'))

shinyUI(bootstrapPage(
    
    selectInput(inputId = 'state1',
                label = 'State',
                choices = c(levels(data$Provider.State)),
                selected = 'MD'),
    
    selectInput(inputId = 'state2',
                label = 'State',
                choices = c(levels(data$Provider.State)),
                selected = 'PA'),
    
    selectInput(inputId = 'drg',
                label = 'Diagnosis-related Group',
                choices = c(levels(data$DRG.Definition)),
                selected = '039 - EXTRACRANIAL PROCEDURES W/O CC/MCC'),
    
    radioButtons(inputId = 'metric',
                 label = "Metric",
                 choices = c('Charges', 'Payments', 'Medicare Payments'),
                 selected = 'Charges'),
    
    plotOutput(outputId = 'box_plot', height = '300px')
))
