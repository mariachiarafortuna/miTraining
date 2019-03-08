#------------------ OGGETTI ----------------

# Somma

1+1

vec1 <- c(1, 3, 7)
vec2 <- c("a", "b", "c")

vec3 <- c(7, 4, 2)

somma <- vec1+vec3

somma

# Dataframe
pippo <- data.frame(
  v1 = vec1,
  v2 = vec2,
  v3 = vec3
)

# Variabili
str(pippo)

# Tabella
View(pippo)




#------------------ DATI ----------------

library(readxl)

mdata <- read_excel("media-data.xlsx")


# Plot

library(ggplot2)

qplot(x = Start, y = Qty, data = mdata, geom = "line") +
  ylim(3000, 6000) +
  theme_minimal() +
  labs(title = "Serie storica di Qty")


qplot(x = Start, y = Qty, data = mdata, geom = "point") +
  ylim(3000, 6000) +
  theme_minimal() +
  labs(title = "Serie storica di Qty")

qplot(x = TV_15, data = mdata, geom = "histogram",
      bins = 10)


#------------- DATA MANIPULATION

library(dplyr)

# Select

radio_data <- select(mdata, Week, Qty, Radio_15, Radio_30)

noradio_data <- select(mdata, -Radio_15, -Radio_30)

digital_data <- select(mdata, settimana = Week, Qty,
                       starts_with("Digital"))


# Filter

mdata_2018 <- filter(mdata, Start >= "2018-01-01")


# Pipe

digital_data <- select(mdata, Start, Qty, 
                       starts_with("Digital"))

digital_2018 <- filter(digital_data,
                       Start >= "2018-01-01")


digital2_2018 <- filter(select(mdata, Start, Qty, 
              starts_with("Digital")),
       Start >= "2018-01-01")

digital3_2018 <- mdata %>%
  select(Start, Qty, starts_with("Digital")) %>%
  filter(Start >= "2018-01-01")


# Creare un nuovo data frame con 
# variabili Start, Qty, e variabili relative alla Radio
# nel periodo fino al 2017
# Rinominare la variabile Start con nome "Inizio"

# Fare il grafico della variabile Radio_15 nel periodo


