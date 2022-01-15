#' show_config UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_show_config_ui <- function(id){
  ns <- NS(id)
  tagList(
    tags$body("Testing this configuration:"),
    verbatimTextOutput(ns("configuration"), placeholder = TRUE)
  )
}
    
#' show_config Server Functions
#'
#' @noRd 
mod_show_config_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$configuration <- renderPrint({
      list(
        get_golem_config("uid"),
        Sys.getenv("HOME")
      )
    })
 
  })
}
    
## To be copied in the UI
# mod_show_config_ui("show_config_ui_1")
    
## To be copied in the server
# mod_show_config_server("show_config_ui_1")
