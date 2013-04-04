post '/urls' do
  @long_url = params[:long_url].downcase
  @shortened_url = (0...8).map{(65+rand(26)).chr}.join
  @url = Url.create(full_url: @long_url, shortened_url: @shortened_url)
  
  if @url.invalid?
    erb :index
  else
    erb :shortened_url
  end 
end

# e.g., /q6bda
get '/:short_url' do
  @long_url_obj = Url.find_by_shortened_url(params[:short_url])
  @long_url_str = @long_url_obj.full_url
  @long_url_obj.increment!(:counter)

  redirect @long_url_str
end
