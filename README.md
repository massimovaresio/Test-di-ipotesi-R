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
**Commento:** `z_alpha` mi sta dicendo quanto sono lontano dalla media, in proporzione alla deviazione standard. Questo intervallo rappresenta il range di valori in cui crediamo che la media reale *mu* dei cannoli si trovi con una probabilità del 95%. Se ripetessimo l’esperimento molte volte, il 95% degli intervalli costruiti in questo modo conterrebbe il vero valore *mu*.

### 2) Costruire un test di ipotesi con probabilità di errore del I tipo pari al 1% per verificare se la media dei diametri dei cannoli è *mu* = 1,20 cm.
In pratica, devo verificare se la media della popolazione è 1,20 cm con probabilità almeno del 99%. Il fatto che la media sia 1,20 cm è l'ipotesi nulla H<sub>0</sub>, cioè quella che devo verificare se è vera o falsa.
- Se sì, accetto H<sub>0</sub> (equivale a dire che l'affermazione è falsa al massimo il 1% delle volte)
- Se no, rifiuto H<sub>0</sub> (equivale a dire che l'affermazione è falsa più del 1% delle volte)

In questo contesto, l'ipotesi alternativa H<sub>1</sub> è che la media sia diversa da 1,20 cm con livello di significatività del 1%, pertanto si tratta di un test bilaterale.

```
# Dati per il test di ipotesi
x_bar <- 1.23      # Media campionaria
mu_0 <- 1.20       # Media ipotizzata sotto H0
sigma <- sqrt(0.04) # Deviazione standard nota
n <- 81            # Dimensione campione
alpha <- 0.01      # Livello di significatività

# Calcolo della statistica test Z
z_test <- (x_bar - mu_0) / (sigma / sqrt(n))

# Valori critici della normale standard per alfa/2
z_critico <- qnorm(1 - alpha/2)

# Decisione del test senza valore assoluto
if (z_test > z_critico) {
  cat("Rifiuto H0: la media è significativamente maggiore di 1.20 cm\n")
} else if (z_test < -z_critico) {
  cat("Rifiuto H0: la media è significativamente minore di 1.20 cm\n")
} else {
  cat("Accetto H0: non ho prove sufficienti per dire che la media è diversa da 1.20 cm\n")
}

# Stampa del valore della statistica test e dei valori critici
cat("Valore della statistica test Z:", z_test, "\n")
cat("Valori critici: -", z_critico, " e ", z_critico, "\n")
```
**Commento:** abbiamo calcolato la statistica test Z e l'abbiamo confrontata con i valori critici della distribuzione Normale. Poiché Z rientra nell'intervallo di accettazione, cioè non eccede i valori critici, non possiamo rifiutare l'ipotesi nulla.

### 3) Calcola il p-value del test precedente.
In pratica, devo verificare se la media della popolazione è 1,20 cm con probabilità almeno del 99%. Il fatto che la media sia 1,20 cm è l'ipotesi nul

```
# Versione di ipotesi con calcolo del p_value

# Calcolo della statistica test Z
z_test <- (x_bar - mu_0) / (sigma / sqrt(n))

# Calcolo del p-value per il test bilaterale
p_value <- 2 * (1 - pnorm(z_test))

# Stampa dei risultati
cat("Statistica test Z:", z_test, "\n")
cat("p-value del test:", p_value, "\n")

# Decisione finale: confronto p-value con alfa
if (p_value < alpha) {
  cat("Rifiutiamo H0: la media è significativamente diversa da 1.20 cm (con livello di confidenza 99%)\n")
} else {
  cat("Non possiamo rifiutare H0: non abbiamo prove sufficienti per dire che la media è diversa da 1.20 cm\n")
}
```
**Commento:** abbiamo calcolato la statistica test Z e l'abbiamo confrontata con i valori critici della distribuzione Normale. Poiché Z rientra nel
