require File.dirname(__FILE__) + '/../helper'

steps_for(:misc) do
  
  Given "an anonymous user" do 
    log_out!
  end

  Given "$an $user_type user named '$login'" do |_, user_type, login|
    create_user! user_type, named_user(login)
  end
  
  Given "a registered user $login" do |login|
    visits "/login"
    # make sure we aren't seeing the log in button
    # which means we are on the login page
    response.should_not have_text(/Log in/)

    fills_in "user[first_name]", :with => login
    fills_in "user[last_name]", :with => login
    fills_in "user[login]", :with => login
    fills_in "user[email]", :with => login + '@test.com'
    fills_in "user[password]", :with => 'secret'
    fills_in "user[password_confirmation]", :with => 'secret'
    clicks_button "Create"
    
    # make sure we didn't see an error page after creating the user
    response.should_not have_text(/error/)
  end

  When "I log in as $login" do |login|
    visits "/login"
    fills_in "login", :with => login
    fills_in "password", :with => named_user(login)['password']
    clicks_button "Log in"
  end

  Then "the browser should show \"$text\"" do |text|
    response.should have_text(Regexp.new(text))
  end
end

def log_out 
  get '/sessions/destroy'
end

def log_out!
  log_out
  response.should redirect_to('/')
  follow_redirect!
end

def create_user(user_params={})
  @user_params       ||= user_params
  post "/users", :user => user_params
  @user = User.find_by_login(user_params['login'])
end

def create_user!(user_type, user_params)
  user_params['password_confirmation'] ||= user_params['password'] ||= user_params['password']
  create_user user_params
  response.should redirect_to('/')
  follow_redirect!
 
  # fix the user's activation status
  activate_user! if user_type == 'activated'
end

def activate_user activation_code=nil
 activation_code = @user.activation_code if activation_code.nil?
 get "/activate/#{activation_code}"
end

def activate_user! *args
  activate_user *args
  response.should redirect_to('/login')
  follow_redirect!
  response.should have_flash("notice", /Signup complete!/)
end

def named_user login
  user_params = {
    'admin'   => {'id' => 1, 'login' => 'addie', 'password' => '1234addie', 'email' => 'admin@example.com',       },
    'oona'    => {          'login' => 'oona',   'password' => '1234oona',  'email' => 'unactivated@example.com'},
    'john'  => {          'login' => 'john', 'password' => 'monkey',    'email' => 'registered@example.com' },
    }
  user_params[login.downcase]
end

def have_flash notice, *args
  have_tag("div##{notice}", *args)
end