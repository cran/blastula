## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----library, include=FALSE---------------------------------------------------
library(blastula)
library(ggplot2)
library(glue)

## ----compose_simple, eval=FALSE-----------------------------------------------
#  compose_email(
#    body =
#  "Hello,
#  
#  I just wanted to let you know that the thing that you asked me for is ready to pick up. So, come over and do that.
#  
#  Cheers
#  ")

## ----compose_simple_glue, eval=FALSE------------------------------------------
#  what <- "thing"
#  salutation <- "Cheers"
#  
#  body_text <-
#    glue(
#      "
#  Hello,
#  
#  I just wanted to let you know that the {what}
#  that you asked me for is ready to pick up. So,
#  come over and do that.
#  
#  {salutation}
#  "
#    )
#  
#  compose_email(body = body_text)

## ----compose_interpolation_stmt, eval=FALSE-----------------------------------
#  #
#  # Prepare the text inputs
#  #
#  
#  sender_name <- "Shelly"
#  
#  sending_date <-
#    paste0(
#      format(Sys.time(), "%A, %B "),
#      format(Sys.time(), "%d") %>% as.numeric(),
#      ", ",
#      format(Sys.time(), "%Y")
#    )
#  
#  body_text <-
#    glue(
#      "
#  Hello,
#  
#  I just wanted to let you know that the *thing* that
#  you asked me for is ready to pick up. So, come over
#  and do that.
#  
#  Cheers,
#  
#  {sender_name}
#  "
#    ) %>% md()
#  
#  footer_text <- glue("Sent on {sending_date}.")
#  
#  # Compose the email message
#  compose_email(
#    body = body_text,
#    footer = footer_text
#  )

## ----imgur_return_value_1, include=FALSE--------------------------------------

imgur_image <- 
  "<a href=\"#\"><img src=\"https://i.imgur.com/8uTB2Py.jpg\" style=\"max-width: 600px; width: 100% !important; display: block; padding: 0; border: 0 !important;\" border=\"0\"></a>"

## ----compose_imgur_local_image, eval=FALSE------------------------------------
#  # Send your image to Imgur with a Client Key;
#  # the result is specially-crafted <img> tag
#  # imgur_image <-
#  #   add_imgur_image(
#  #     image = "rickenbacker_4001_1972_fireglo.jpg",
#  #     client_id = "<YOUR CLIENT ID>"
#  #   )
#  
#  #
#  # Create the `body_text` and then the
#  # email message with `compose_email()`
#  #
#  
#  body_text <-
#    glue(
#      "
#  Hello,
#  
#  I just wanted to let you know that the **1972 Rickenbacker
#  4001** is here to pick up. Here is a picture of it:
#  
#  {imgur_image}
#  
#  Cheers,
#  
#  {sender_name}
#  "
#    ) %>% md()
#  
#  compose_email(body = body_text)

## ----imgur_return_value_2, include=FALSE--------------------------------------

imgur_image <- 
  "<a href=\"#\"><img src=\"https://i.imgur.com/biMpEEA.png\" style=\"max-width: 600px; width:100% !important; display: block; padding: 0; border: 0 !important;\" border=\"0\"></a>"

## ----compose_imgur_ggplot, eval=FALSE-----------------------------------------
#  # Create the plot data
#  variety <- rep(LETTERS[1:7], each = 40)
#  treatment <- rep(c("high", "low"), each = 20)
#  note <- seq(1:280) + sample(1:150, 280, replace = TRUE)
#  data <- data.frame(variety, treatment, note)
#  
#  # Create the plot
#  the_plot <-
#    ggplot(data, aes(x = variety, y = note, fill = treatment)) +
#    geom_boxplot()
#  
#  # Send your ggplot to Imgur with a Client Key;
#  # again, you get an <img> tag that works for email
#  # imgur_image <-
#  #   add_imgur_image(
#  #     image = the_plot,
#  #     client_id = "<YOUR CLIENT ID>"
#  #   )
#  
#  #
#  # Create the `body_text` and then the
#  # email message with `compose_email()`
#  #
#  
#  body_text <-
#    glue(
#      "
#  Hello,
#  
#  I just wanted to let you know that the *ggplot* you \\
#  wanted to see is right here, in this email:
#  
#  {imgur_image}
#  
#  Cheers,
#  
#  {sender_name}
#  "
#    ) %>% md()
#  
#  compose_email(body = body_text)

