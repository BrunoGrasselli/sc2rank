Given /^an user exists$/ do ||
  User.create! :email => 'test@email.com', :password => '123456', :password_confirmation => '123456'
end
