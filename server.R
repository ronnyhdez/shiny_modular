# server

server <- function(input, output, session) {
  
  res_auth <- secure_server(
    check_credentials = check_credentials(credentials)
  )
  
  # Llamados a modulos simple
  deslizadores_dos <- callModule(module = deslizador, id =  "deslizador_segundo")
  
  # Modulo en un objeto
  deslizadores <- callModule(module = deslizador, id = "deslizador_nuevo")
  
  # Deslizadores lo tenemos como una lista con dos funciones
  print(deslizadores) # Para corrobar lo que viene de deslizadores
  
  observeEvent(input$goButton, {
    frec <- deslizadores$frec_input()
    max <- deslizadores$max_input()
    
        callModule(module = nube,
                   id = "nube_palabras",
                   frecuencia = frec,
                   maximo = max)
  })
  
  
  # observeEvent(
  #   (deslizadores$frec_input() | deslizadores$max_input()), {
  #     
  #     callModule(module = nube,
  #                id = "nube_palabras",
  #                frecuencia = deslizadores$frec_input(),
  #                maximo = deslizadores$max_input())  
  #   }
  # )


  
  
  ## Otros segmentos -----------------------------------------------------------
  # Llamar módulo en objeto para traer selecciones
  carriers <- callModule(module = seleccionador, id = "carrier_seleccionador")
  print(carriers) # Prueba para revisar qué trae.
  
  observeEvent(
    carriers$carrier_input(), {
      callModule(module = grafico,
                 id = "grafico_aviones",
                 aerolinea = carriers$carrier_input())
    }
  )
}