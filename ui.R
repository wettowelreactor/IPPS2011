library(shiny)
data <- read.csv(unz('./data/IPPS_FY2011.csv.zip', 'IPPS_FY2011.csv'))

shinyUI(bootstrapPage(
    
    selectInput(inputId = 'state',
                label = 'State',
                choices = c('United States (All)', levels(data$Provider.State)),
                selected = 'United States (All)'),
    
    selectInput(inputId = 'drg',
                label = 'Diagnosis-related Group',
                choices = c(levels(data$DRG.Definition)),
                selected = '039 - EXTRACRANIAL PROCEDURES W/O CC/MCC'),
    
    radioButtons(inputId = 'chart',
                 label = 'Chart Type',
                 choices = c('Histogram', 'Boxplot'),
                 selected = 'Histogram'),
    
    plotOutput(outputId = 'hist_charge_plot', height = '300px')    
))
