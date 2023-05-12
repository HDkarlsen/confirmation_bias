# The rule. Three numbers, in any ascending order

# Test test
right1 <- c(2, 4, 6)
right2 <- c(-2, 6, 110)
wrong1 <- c(1, 2, 3, 4)
wrong2 <- c(1, 2, 0)
wrong3 <- c(1, 2, "3")

tests <- list(right1, right2, wrong1, wrong2, wrong3)

# A function that evaluates the attempt and returns TRUE/FALSE.
test_rule <- function(attempt) {
  result <- attempt[1] < attempt[2] & attempt[2] < attempt[3]
  result
}

# Checks for errors. If not, returns same vector.
catch_error <- function(attempt) {
  if (length(attempt) != 3) return("Error: Wrong length. Try again.")
  if (!is.numeric(attempt)) return("Error: I only accept numbers. Try again.")
  return(attempt)
}

# Checks for errors and in the absence it returns the result of the test.
run_test <- function(attempt) {
  checked_attempt <- catch_error(attempt)
  
  if (is.character(checked_attempt)) return(checked_attempt)
  
  test_rule(attempt)
}

