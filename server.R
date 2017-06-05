
library(shiny)
library(quantmod)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    load("./data.RData")
    data=if(input$select=="Apple") Apple else if(input$select=="DELL") DELL
     else if(input$select=="DIA") DIA else if(input$select=="Google") Google
    else if(input$select=="IBM") IBM else if(input$select=="Microsoft") Microsoft
    data1=data[paste0(input$date1,"/",input$date2)]
    low1=min(data1[,4])
    high1=max(data1[,4])
    netinc=data1[[nrow(data1),4]]-data1[[1,4]]
    # Generate a graph on the value chosen
    chartSeries(data1, theme = chartTheme("white"), 
                type = "auto", log.scale = FALSE, TA = NULL,name=input$select)
    output$text1=renderText(paste0("The graph above shows the stock trend of ",input$select," from ",as.character(input$date1)," and ",as.character(input$date2)))
    output$text2=renderText(paste0("Lowest price: $",low1,"        Highest price:$",high1,"            Net Change:$",netinc))
    dt1=data.frame(row.names( data.frame(data1)),data1)
    names(dt1)=c("Date",names(data1))
    output$dt=renderDataTable(data.frame(row.names( data.frame(data1)),data1))
  })
  
})
