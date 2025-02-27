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


# Dati per il test di ipotesi
rm(list = ls())

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



