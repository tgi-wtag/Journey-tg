module AuthenticationHelper
  def sign_in_user(user)
    session[:user_id] = user.id
  end
end
