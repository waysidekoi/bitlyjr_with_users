enable :sessions

post '/sign_up' do
  @encrypted = Digest::SHA1.hexdigest(params[:password])
  @user = User.create(email: params[:email], password: @encrypted)
  @user.valid? ? @message = "New user created for #{params[:email]}" : @message = @user.errors.full_messages.first
  erb :index
end



