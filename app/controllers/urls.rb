get '/urls' do
  404
end

post '/urls' do
  @long_url = params[:long_url].downcase
  @shortened_url = (0...8).map{(65+rand(26)).chr}.join
  @url = Url.create(full_url: @long_url, short_url: @shortened_url, user_id: session[:current_user_id])  
  if logged_in?
    @email = User.find_by_id(session[:current_user_id]).email
    @past_urls = Url.where("user_id = ?", session[:current_user_id])
    @error_message = @url.errors.full_messages.first unless @url.valid?
    erb :logged_in
  elsif @url.invalid?
    erb :index
  else
    erb :shortened_url
  end 
end

# e.g., /q6bda
get '/:short_url' do

  @long_url_obj = Url.find_by_short_url(params[:short_url])
  @long_url_str = @long_url_obj.full_url
  @long_url_obj.increment!(:counter)

  redirect @long_url_str
end
