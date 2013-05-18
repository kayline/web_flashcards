helpers do

  def current_user
   p @current_user ||= User.find(session[:id]) if session[:id]
  end

end



