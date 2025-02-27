# Test-di-ipotesi-R
Esercizi di statistica computazionale con software R

Questa repo contiene un esercizio proposto come progetto per l'esame universitario del corso di *Statistica computazionale* presso l'Università del Piemonte Orientale.

L'esercizio è implementato con linguaggio R e software statistico [RStudio](https://posit.co/download/rstudio-desktop/).

Si prega di rispettare i termini di licenza descritti nel file `LICENSE.md`

## Esercizio
Un'azienda di pasticceria vuole fare un'analisi qualità per verificare il diametro dei cannoli prodotti. Raccolgono un campione di 81 cannoli freschi di produzione, ottendendo una media campionaria di 1,23 cm. Si assuma che il campione è gaussiano con una media *mu* ignota e varianza nota *sigma quadro* = 0,04 cm.

### 1) Costruire un intervallo di confidenza bilatero per la media del diametro di livello 95%.
```
# Introduzione
x_bar <- 1.23      # Media campionaria
sigma <- sqrt(0.04) # Deviazione standard nota
n <- 81            # Numero di osservazioni
alpha <- 0.05      # Livello di significatività
z_alpha <- qnorm(1 - alpha/2)  # Quantile della Normale Standard
se <- (sigma / sqrt(n)) # Standard error

# Calcolo dell'intervallo di confidenza
lower_bound <- x_bar - (z_alpha * se)
upper_bound <- x_bar + (z_alpha * se)

# Stampa dei risultati
cat("Intervallo di confidenza al 95% per mu: [", lower_bound, ",", upper_bound, "]\n")
```
**Commento:** questo intervallo rappresenta il range di valori in cui crediamo che la media reale *mu* dei cannoli si trovi con una probabilità del 95%. Se ripetessimo l’esperimento molte volte, il 95% degli intervalli costruiti in questo modo conterrebbe il vero valore *mu*.
