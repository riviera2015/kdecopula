print.kdecopula <- function(x, ...) {
    cat("Kernel copula density estimate (class 'kdecopula') \n")
    cat("-------------------------------------------------- \n")
    cat("Observations:", nrow(x$udata), "\n")
    cat("Method:      ", x$method, "\n")
    if (x$method %in% c("MR", "beta")) {
        cat("Bandwidth: ", round(x$bw,3), "\n")
    } else if (x$method %in% c("TLL1", "TLL2")) {
        cat("Bandwidth:   ",
            " alpha = ", round(x$bw$alpha, 2), "\n              ",
            "B = matrix(c(", paste(round(x$bw$B, 2), collapse = ", "), "), 2, 2)\n",
            sep = "")
    } else if (x$method %in% c("T")) {
        cat("Bandwidth:   ",
            "B = matrix(c(", paste(round(x$bw$B, 2), collapse = ", "), "), 2, 2)\n",
            sep = "")
    } 
}

summary.kdecopula <- function(object, ...) {
    cat("Kernel copula density estimate (class 'kdecopula') \n")
    cat("-------------------------------------------------- \n")
    cat("Observations:", nrow(object$udata), "\n")
    cat("Method:      ", object$method, "\n")
    if (object$method %in% c("MR", "beta")) {
        cat("Bandwidth: ", round(object$bw,3), "\n")
    } else if (object$method %in% c("TLL1", "TLL2")) {
        cat("Bandwidth:   ",
            " alpha = ", object$bw$alpha, "\n              ",
            "B = matrix(c(", paste(round(object$bw$B, 2), collapse = ", "), "), 2, 2)\n",
            sep = "")
    } else if (object$method %in% c("T")) {
        cat("Bandwidth:   ",
            "B = matrix(c(", paste(round(object$bw$B, 2), collapse = ", "), "), 2, 2)\n",
            sep = "")
    } 
    cat("-------------------------------------------------- \n")
    if (is.null(object$info)) {
        cat("No further information provided. Use kdecop(..., 'info = TRUE'), for more.")
    } else {
        cat("logLik:", round(object$info$loglik, 2), "   ")
        cat("AIC:", round(object$info$AIC, 2), "   ")
        cat("cAIC:", round(object$info$cAIC, 2), "   ")
        cat("BIC:", round(object$info$BIC, 2), "\n")
        cat("Effective number of parameters:", round(object$info$effp, 2))
    }
}