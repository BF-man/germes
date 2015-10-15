Given /^есть пользователи "(.*)"$/ do |names|
  names.split(', ').each do |name|
    user = User.new
    user.email = "#{ name.gsub(/ /){""} }@example.com"
    user.name = name
    user.task = "задача пользователя #{name}"
    user.password = '12345678'
    user.password_confirmation = '12345678'
    user.save!
  end
end


