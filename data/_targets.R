# _targets.R
library(targets)
library(stantargets)

tar_option_set(
  seed = 54147,
  format = "qs",
  garbage_collection = TRUE
)

generate_data <- function(n = 10) {
  true_beta <- stats::rnorm(n = 1, mean = 0, sd = 1)
  x <- seq(from = -1, to = 1, length.out = n)
  y <- stats::rnorm(n, x * true_beta, 1)
  list(n = n, x = x, y = y, true_beta = true_beta)
}

# The _targets.R file ends with a list of target objects
# produced by stantargets::tar_stan_mcmc(), targets::tar_target(), or similar.
list(
  tar_stan_mcmc(
    name       = example,
    stan_files = "Stan/x.stan",
    data       = generate_data(),
    
    chains = 4,
    parallel_chains = 4,
    save_warmup = TRUE
    
    # stdout = R.utils::nullfile(),
    # stderr = R.utils::nullfile(),
  )
)
