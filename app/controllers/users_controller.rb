class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/books'
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    user = User.new(params[:user])
    if !user.valid?
      redirect to '/signup'
    else
      user.save
      session[:user_id] = user.id
      redirect to '/books'
    end
  end
end
