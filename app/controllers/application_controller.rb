require "./config/environment"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, "public"
    set :views, "app/views"
    # enable :sessions
    # get :session_secret, "bloggerama"
  end

end
