When(/^я ввожу "(.*)" в поле "(.*)"$/) do |value, field|
  fill_in field, with: value
end

When(/^я нажимаю кнопку "(.*)"$/) do |button|
  click_button I18n.t(button)
end


When(/^я нажимаю ссылку "(.*)"$/) do |link|
  click_link I18n.t(link)
end

When(/^я вижу "(.*)"$/) do |words|
  words.split(', ').each do |word|
    page.assert_text(word)
  end
end

When(/^я вижу поле с текстом "(.*)"$/) do |word|
  page.driver.browser.execute_script("$('.task :input').filter(function(){return this.value=='#{word}'}).val()")
end

When(/^я изменяю задачу пользователя "(.*)" на "(.*)"$/) do |user, new_task|
  #user's name format should be My_Name and not My Name
  user = name_gsub(user)
  #<div> with id='user_name' is a parent of <input>
  #<input> value is a task of user_name
  input_id = page.find("##{user}").find('input')[:id]
  fill_in input_id, with: new_task
  #triggering onBlur event to send updated field
  page.driver.browser.execute_script("$('##{input_id}').trigger('blur')")
end

When /^я жду "(\d+)" секунд.*$/ do |seconds|
  sleep seconds.to_i
end

When(/^я не могу измен.+ть пол.+ с задач.* пользовател.* "(.*)"$/) do |users|
  users.split(', ').each do |user|
    #user's name format should be My_Name and not My Name
    user = name_gsub(user)
    input_id = page.find("##{user}").find('input')[:disabled]
    expect(input_id).to eq('true')
  end
end

When(/^задач.+ пользовател.* "(.*)" это label$/) do |users|
  users.split(', ').each do |user|
    #user's name format should be My_Name and not My Name
    user = name_gsub(user)
    page.find("##{user}").find('label')
  end
end