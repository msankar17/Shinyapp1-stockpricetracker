
library(shiny)

shinyUI(fluidPage(
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "app.css")  ),
  # Application title
  titlePanel("Stock history tracking"),

  
  sidebarLayout(
    sidebarPanel(
       selectInput("select",label="Choose the stock",
       choices = list("Google", "Microsoft" ,
                      "Apple" , "DIA" ,"IBM"), selected = "IBM"),
       dateInput("date1",label="Start Date",value="2007-10-03",min="2007-10-03",max="2017-06-02"),
       dateInput("date2",label="End Date",value="2017-06-02",min="2007-10-03",max="2017-06-02"),
       strong(div("Application help documentation:")),br(),
       div("The below application can be used to understand the stock price history of 5 important stocks - Apple, Google, Microsft,DIA,IBM"),br(),
       div("Select the stock that you want to analyze for historical price from the drop down menu"),br(),
       div("Also the the time period for which you want to analyze the share price history can be changed by using the date selectors above"),br(),
       div("The plot on the right side(main panel) would show the price history in a graph and below the graph you can see the following factors in bold"),br(),
       div("Highest price, Lowest price and Net change"), br(),
       div("These factors should help you in making a decision on purchasing this share"),br(),
       div("Also a table is shown below it with detailed data on the share price for the selection"),br(),
       div("You can use this data to search using the options provided and make educated decisions"),br(),
       div("Good Luck")
        ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       br(),br(),
       div( textOutput("text1")),br(),
       strong(textOutput("text2")),br(),
       dataTableOutput("dt")
    )
  )
))
