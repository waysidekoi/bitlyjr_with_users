require 'debugger'
require 'digest/sha1'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/secret' do
  return "NOT AUTHORIZED" unless logged_in?

  erb :secret
end
