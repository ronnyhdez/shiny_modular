# server

server <- function(input, output, session) {
  
  # Llamados a modulos simple
  deslizadores_dos <- callModule(module = deslizador, id =  "deslizador_segundo")
  
  # Modulo en un objeto
  deslizadores <- callModule(module = deslizador, id = "deslizador_nuevo")
  
  # Deslizadores lo tenemos como una lista con dos funciones
  print(deslizadores) # Para corrobar lo que viene de deslizadores
  
  observeEvent(
    (deslizadores$frec_input() | deslizadores$max_input()), {
      
      callModule(module = nube,
                 id = "nube_palabras",
                 frecuencia = deslizadores$frec_input(),
                 maximo = deslizadores$max_input())  
    }
  )
  
  observeEvent(
    (deslizadores_dos$frec_input() | deslizadores_dos$max_input()), {
      
      callModule(module = nube,
                 id = "nube_2",
                 frecuencia = deslizadores_dos$frec_input(),
                 maximo = deslizadores_dos$max_input())  
    }
  )
  
  
  
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