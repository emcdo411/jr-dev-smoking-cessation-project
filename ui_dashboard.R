library(shiny)
library(plotly)

ui <- fluidPage(
  titlePanel("VA Smoking Cessation Tracker"),
  sidebarLayout(
    sidebarPanel(
      textInput("username", "Username", placeholder="Enter username"),
      actionButton("login", "Login"),
      selectInput("age_filter", "Filter by Age", choices=c("All", seq(40, 55)), selected="All"),
      selectInput("status_filter", "Filter by Status", choices=c("All", "Active", "Quit", "In Progress", "Relapsed"), selected="All")
    ),
    mainPanel(
      plotlyOutput("progress_plot"),
      tableOutput("veteran_table")
    )
  )
)
