class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/books'
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    if !params.values.all? {|value| !value.blank?}
      redirect to '/signup'
    else
      user = User.find_or_create_by(params[:user])
      session[:user_id] = user.id
      redirect to '/books'
    end
  end
end
