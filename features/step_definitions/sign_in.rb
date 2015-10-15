
When /^я авторизуюсь как администратор$/ do
  step "я перехожу на страницу администратора"
  step "я ввожу \"admin@example.com\" в поле \"admin_user_email\""
  step "я ввожу \"12345678\" в поле \"admin_user_password\""
  step "я нажимаю кнопку \"login\""
end

When /^я авторизуюсь как пользователь "Hulk"$/ do
  step "я нажимаю ссылку \"sign_in\""
  step "я ввожу \"hulk@example.com\" в поле \"user_email\""
  step "я ввожу \"12345678\" в поле \"user_password\""
  step "я нажимаю кнопку \"log_in\""
end