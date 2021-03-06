# Package de manipulation de données (data frame)
library(dplyr)

# Package de données
library(nycflights13)
data(flights)
data(airports)

# Sélection de colonnes
select(flights, origin, dest, distance) 
   origin dest  distance
   <chr>  <chr>    <dbl>
 1 EWR    IAH       1400
 2 LGA    IAH       1416

# Filtre sur les lignes
filter(flights, carrier == 'AA', year == 2013)

# Tri (sur 1 ou plusieurs colonnes)
arrange(flights, distance)

# Ajout de colonnes 
airports <- mutate(airports, alt_m = alt / 3.2808)

select(airports, name, alt, alt_m)
   name                             alt  alt_m
   <chr>                          <int>  <dbl>
 1 Lansdowne Airport               1044 318.  
 2 Moton Field Municipal Airport    264  80.5 

# Opérateur %>% pour les pipes
max(select(filter(flights, carrier == 'AA'), distance))

flights %>% 
    filter(carrier == 'AA') %>%
    select(distance) %>%
    max

# Nombre de vols par destination
flights %>%
    group_by(dest) %>%
    summarise(nb = n())