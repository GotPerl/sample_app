module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
    #cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end

  def sign_out
    #cookies.delete(:remember_token)
    session.delete(:user_id)
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  private

  def user_from_remember_token
    #remember_token = cookies[:remember_token]
    #User.find_by_remember_token(remember_token) unless remember_token.nil?
    User.find(session[:user_id]) unless session[:user_id].nil?
  end
end
