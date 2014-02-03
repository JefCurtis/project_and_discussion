ActionMailer::Base.smtp_settings = {

  address:                    "smtp.gmail.com",
  port:                       "587",
  user_name:                  ENV['email_user'],
  password:                   ENV['email_password'],
  authentication:             :plain,
  enable_starttls_auth:       true
}