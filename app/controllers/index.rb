require 'debugger'
require 'digest/sha1'

get '/' do
  if session[:current_user_id]
    user_id = session[:current_user_id]
    @email = User.find_by_id(user_id).email
    @past_urls = Url.where("user_id = ?", user_id)
    erb :logged_in
  else
    erb :index
  end
end

