
.onAttach <- function(lib, pkg) {
  packageStartupMessage("This is perudiv ",
                        utils::packageDescription("perudiv",
                                                  fields = "Version"
                        ),
                        appendLF = TRUE
  )
}


# -------------------------------------------------------------------------

show_progress <- function() {
  isTRUE(getOption("perudiv.show_progress")) && # user disables progress bar
    interactive() # Not actively knitting a document
}



.onLoad <- function(libname, pkgname) {
  opt <- options()
  opt_perudiv <- list(
    perudiv.show_progress = TRUE
  )
  to_set <- !(names(opt_perudiv) %in% names(opt))
  if (any(to_set)) options(opt_perudiv[to_set])
  invisible()
}


# -------------------------------------------------------------------------
