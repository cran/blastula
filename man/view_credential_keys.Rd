% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/retrieve_credentials.R
\name{view_credential_keys}
\alias{view_credential_keys}
\title{View all available \strong{blastula} credential keys}
\usage{
view_credential_keys()
}
\description{
To understand which keys have been set using the \code{\link[=create_smtp_creds_key]{create_smtp_creds_key()}}
function (and how they are identified), we can use the
\code{view_credential_keys()} function. What's provided is a tibble with three
columns: \code{id}, \code{key_name}, and \code{username}.
}
\details{
Support for using the \code{view_credential_keys()} function (and for doing any
credential key management) is provided through the \strong{keyring} package. This
function cannot be used without that package being available on the system.
We can use \code{install.packages("keyring")} to install \strong{keyring}.
}
\examples{
# View the available SMTP credentials
# that are in the system's secure
# key-value store; the `id` values
# in the returned tibble provide what's
# necessary to send email through
# `smtp_send()` and the `creds_key()`
# credential helper function

# view_credential_keys()

}
