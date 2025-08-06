library(shiny)
library(jsonlite)
library(plotly)

server <- function(input, output, session) {
  # Simulated authentication
  observeEvent(input$login, {
    if (nchar(input$username) > 0) {
      showNotification("Login successful!", type="message")
    } else {
      showNotification("Please enter a username.", type="error")
    }
  })
  
  # Load JSON data
  data <- reactive({
    json_file <- "data/veterans_data.json"
    if (file.exists(json_file)) {
      data <- fromJSON(json_file)
      # Validate data
      required_cols <- c("id", "name", "age", "enrollment_date", "progress_score", "smoking_status", "coaching_notes")
      if (all(required_cols %in% names(data))) {
        return(data)
      } else {
        showNotification("Missing required fields in JSON data.", type="error")
        return(NULL)
      }
    } else {
      showNotification("JSON file not found.", type="error")
      return(NULL)
    }
  })
  
  # Filter data based on inputs
  filtered_data <- reactive({
    req(data())
    df <- data()
    if (input$age_filter != "All") {
      df <- df[df$age == as.integer(input$age_filter), ]
    }
    if (input$status_filter != "All") {
      df <- df[df$smoking_status == input$status_filter, ]
    }
    df
  })
  
  # Render Plotly progress plot
  output$progress_plot <- renderPlotly({
    req(filtered_data())
    plot_ly(filtered_data(), x=~name, y=~progress_score, type="bar", 
            color=~smoking_status, text=~progress_score, textposition="auto") %>%
      layout(title="Veteran Progress Scores", xaxis=list(title="Veteran"), yaxis=list(title="Progress Score"))
  })
  
  # Render data table
  output$veteran_table <- renderTable({
    req(filtered_data())
    filtered_data()[, c("id", "name", "age", "smoking_status", "coaching_notes")]
  })
}
