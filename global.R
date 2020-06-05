
# Paquetes ----------------------------------------------------------------
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(shiny)
library(shinydashboard)
library(ggplot2)
library(nycflights13)
library(dplyr)
library(shinymanager)

# Cargar modulos ----------------------------------------------------------
source("modules/nube.R")
source("modules/deslizador.R")
source("modules/grafico.R")
source("modules/seleccionador.R")

credentials <- data.frame(
  user = c("ronny", "german"),
  password = c("ixpantia", "12345"),
  admin = c(FALSE, TRUE),
  stringsAsFactors = FALSE
)

# Leer archivo ------------------------------------------------------------
text <- readLines("words")
docs <- Corpus(VectorSource(text))
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removePunctuation)
dtm <- TermDocumentMatrix(docs)
matriz <- as.matrix(dtm)
matriz_ordenada <- sort(rowSums(matriz), decreasing = TRUE)
datos_nube <- data.frame(word = names(matriz_ordenada), freq = matriz_ordenada)
