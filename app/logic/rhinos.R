box::use(
    rhino,
    reactable[reactable],
)

#' @export
fetch_data <- function() {
    rhino::rhinos
}

#' @export
table <- function(data) {
    data |> 
    reactable()
}