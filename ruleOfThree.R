
hint <- c(2, 4, 6)
hint2 <- c(3, 4, 5, 6, 7, 11)
hint3 <- c(-4, 0, 4)
hint4 <- c(-4, -0.5, 1.5, 9)
wrong <- c(4, 5, 1)


# library(tidyverse)

for (i in (1:(length(hint2)-1))) {
  print(hint2[i] < hint2[i+1])
}

# Tests the rule.
test_rule <- function(attempt) {
  
  # Raises error if attempt doesn't contain numbers
  if (!is.numeric(attempt)) {
    return("Error: I only accept numbers.")
  }
  
  # Initialise empty vector to store values in later
  results <- c()
  
  # Iterate over the attempt and check if each element is lower than the next
  for (i in 1:(length(attempt)-1)) {
    results <- c(results, attempt[i] < attempt[i + 1])
  }
  
  # Checks if there were any elements that disobeyed the rule
  out <- ifelse(FALSE %in% results, "Incorrect", "Correct")
  
  # Returns the result
  out
}

test_rule(hint2)
test_rule(wrong)
test_rule(c(1, "2", 3))

# ----

# The rule. Three numbers, in any ascending order

# Test test
right1 <- c(2, 4, 6)
right2 <- c(-2, 6, 110)
wrong1 <- c(1, 2, 3, 4)
wrong2 <- c(1, 2, 0)
wrong3 <- c(1, 2, "3")

tests <- list(right1, right2, wrong1, wrong2, wrong3)

# A functiont that evaluates the attempt

test_rule <- function(attempt) {
  
  if (length(attempt) != 3) return("Error: Wrong length. Try again.")
  
  if (!is.numeric(attempt)) return("Error: I only accept numbers. Try again")
  
  result <- attempt[1] < attempt[2] & attempt[2] < attempt[3]
  
  result
}

test_rule(wrong3)
