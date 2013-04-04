post '/login' do
  @email = params[:email]
  @encrypted = Digest::SHA1.hexdigest(params[:password])
  
  user = User.authenticate(@email,@encrypted)
  if user.present?
    login! user
    redirect '/secret'

  else
    @message2 = "Invalid login"
    erb :index
  end
end

get '/logout' do  
  logout!
  redirect '/'
end



helpers do

  def login! user
    session[:current_user_id] = user.id
  end

  def logout!
    session.clear
  end

  def logged_in?
    session[:current_user_id].present?
  end

  def current_user
    return nil unless logged_in?
    @current_user ||= User.find(session[:current_user_id])
  end

end
