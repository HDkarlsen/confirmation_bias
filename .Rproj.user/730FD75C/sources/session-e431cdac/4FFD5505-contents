# The rule. Three numbers, in any ascending order

library(magrittr)

# Takes a list of three numbers and cleans it.
clean_input <- function(numbers) {
  # Assumes three digits in a string, separated by a comma
  # Removes whitespace, splits on comma, turns into numeric
  out <- numbers %>% 
    stringr::str_remove_all(" ") %>% 
    stringr::str_split_1(",") 
  out <- tryCatch(
    {
      # If no error/warning spotted
      as.numeric(out)
    },
    error = function(cond) {
      message("Seems like you entered something wrong. Read the instructions and try again")
      return("")
    },
    warning = function(cond) {
      message("Seems you entered something wrong. Read the instructions and try again.")
      return("")
    }
  )
  out
}

# Evaluates the attempt and returns TRUE/FALSE.
test_rule <- function(attempt) {
  result <- attempt[1] < attempt[2] & attempt[2] < attempt[3]
  result
}

# Checks for errors. If not, returns same vector.
catch_error <- function(attempt) {
  if (!is.numeric(attempt)) return("Error: I only accept numbers. Try again.")
  if (length(attempt) != 3) return("Error: Wrong length. Try again.")
  return(attempt)
}

# Combines the three functions into one.
run_test <- function(attempt) {
  attempt <- clean_input(attempt) 
  checked_attempt <- catch_error(attempt)
  if (is.character(checked_attempt)) return(checked_attempt)
  test_rule(attempt)
}

