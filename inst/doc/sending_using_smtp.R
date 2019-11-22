## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----creds_key_1, eval=FALSE---------------------------------------------
#  # Store SMTP credentials using the
#  # system's secure key-value store;
#  # provide the `id` of "gmail"
#  create_smtp_creds_key(
#    id = "gmail",
#    user = "user_name@gmail.com",
#    host = "smtp.gmail.com",
#    port = 465,
#    use_ssl = TRUE
#  )

## ----creds_key_2, eval=FALSE---------------------------------------------
#  # Store SMTP credentials in the
#  # system's key-value store with
#  # `provider = "gmail"`
#  create_smtp_creds_key(
#    id = "gmail",
#    user = "user_name@gmail.com",
#    provider = "gmail"
#  )

## ----creds_file_1, eval=FALSE--------------------------------------------
#  # Store SMTP credentials as a file
#  # with the filename "gmail_creds"
#  create_smtp_creds_file(
#    file = "gmail_creds",
#    user = "user_name@gmail.com",
#    host = "smtp.gmail.com",
#    port = 465,
#    use_ssl = TRUE
#  )

## ----creds_file_2, eval=FALSE--------------------------------------------
#  # Create a credentials file for sending
#  # email through Gmail
#  create_smtp_creds_file(
#    file = "gmail_creds",
#    user = "user_name@gmail.com",
#    provider = "gmail"
#  )

## ----prepare_test_message, eval=FALSE------------------------------------
#  # Create the test message, this returns
#  # an `email_message` object
#  test_message <- prepare_test_message()
#  
#  # Preview the message in the Viewer
#  test_message

## ----echo = FALSE, out.width = "100%"------------------------------------
knitr::include_graphics("prepare_test_message.png", dpi = 300)

## ----smtp_send_creds_manual, eval=FALSE----------------------------------
#  # Sending email to a personal account
#  # through manual specification of SMTP
#  # credentials
#  test_message %>%
#    smtp_send(
#      from = "personal@email.net",
#      to = "personal@email.net",
#      subject = "Testing the `smtp_send()` function",
#      credentials = creds(
#        user = "user_name@gmail.com",
#        provider = "gmail"
#      )
#    )

## ----smtp_send_creds_key, eval=FALSE-------------------------------------
#  # Sending email to a personal account
#  # using the credentials key
#  test_message %>%
#    smtp_send(
#      from = "personal@email.net",
#      to = "personal@email.net",
#      subject = "Testing the `smtp_send()` function",
#      credentials = creds_key(id = "gmail")
#    )

## ----smtp_send_creds_file, eval=FALSE------------------------------------
#  # Sending email to a personal account
#  # using the on-disk credentials file
#  test_message %>%
#    smtp_send(
#      from = "personal@email.net",
#      to = "personal@email.net",
#      subject = "Testing the `smtp_send()` function",
#      credentials = creds_file(file = "gmail_creds")
#    )

## ----install_github, eval=FALSE------------------------------------------
#  remotes::install_github("rich-iannone/blastula")

