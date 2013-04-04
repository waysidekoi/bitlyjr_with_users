enable :sessions

post '/sign_up' do
  
  unless params[:password] == ""
    @encrypted = Digest::SHA1.hexdigest(params[:password])
  end
  @user = User.create(email: params[:email], encrypted_password: @encrypted)
  if @user.valid? 
    @email = params[:email]
    @past_urls = Url.where("user_id = ?", @user.id)

    login! @user    

    erb :logged_in 
  else
    @message = @user.errors.full_messages.first
    erb :index

  end
end

get '/users/:id' do
  user_id = params[:id]
  @email = User.find(user_id).email
  @past_urls = Url.where("user_id = ?", user_id)

  erb :profile

end
