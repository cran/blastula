# nocov start

#' View available credentials keys
#'
#' @export
view_credential_keys <- function() {

  get_keyring_creds_table()
}

# nocov end

#' Retrieve metadata and authentication values from an on-disk credentials file
#'
#' @noRd
get_smtp_file_creds <- function(file_name = NULL) {

  # For the given `file_name`, read in the JSON
  # data and convert it into a list object
  readLines(file_name, encoding = "UTF-8") %>%
    jsonlite::unserializeJSON()
}

# nocov start

#' Retrieve metadata and authentication values from keyring data
#'
#' @noRd
get_smtp_keyring_creds <- function(id = NULL) {

  # We requires the installation of the keyring package
  if (!requireNamespace("keyring", quietly = TRUE)) {

    stop("The `keyring` package is required.",
         call. = FALSE)
  }

  id_name <- id

  # Get a filtered table of key and values that
  # are only those keys generated by the
  # `create_smtp_creds_key()` function
  blastula_keys_tbl <-
    get_keyring_creds_table() %>%
    dplyr::filter(id == id_name)

  # If the given `key_name` doesn't correspond to an
  # entry in `blastula_keys_tbl`, stop the function with
  # an explanatory message
  if (nrow(blastula_keys_tbl) == 0) {
    stop("There is no blastula key that corresponds to the `key_name` of \"",
         key_name, "\".",
         call. = FALSE)
  }

  # Get the `key_name`
  key_name <- (blastula_keys_tbl %>% dplyr::pull(key_name))[1]

  # Get the `username`
  username <- (blastula_keys_tbl %>% dplyr::pull(username))[1]

  # For the given `key_name` get the key's stored value and
  # transform the JSON data to a list object
  keyring::key_get(service = key_name, username = username) %>%
    jsonlite::unserializeJSON()
}

#' Utility function for obtaining keyring entries related to blastula creds
#'
#' @noRd
get_keyring_creds_table <- function() {

  creds_tbl <-
    keyring::key_list() %>%
    dplyr::as_tibble() %>%
    dplyr::filter(grepl(paste0("blastula-v", schema_version), service))

  if (nrow(creds_tbl) == 0) {

    empty_creds_tbl <-
      dplyr::tibble(
        id = NA_character_,
        key_name = NA_character_,
        username = NA_character_
      )[-1, ]

    return(empty_creds_tbl)

  } else {

    creds_tbl <-
      creds_tbl %>%
      dplyr::mutate(package = (strsplit(service, "-") %>% unlist())[1]) %>%
      dplyr::mutate(version = (strsplit(service, "-") %>% unlist())[2]) %>%
      dplyr::mutate(key_name = (strsplit(service, "-") %>% unlist())[3]) %>%
      dplyr::rename(id = key_name, key_name = service) %>%
      dplyr::select(id, key_name, username)
  }

  creds_tbl
}

# nocov end
