class BooksController < ApplicationController

  # index action
  get '/books' do
    @books = Book.all
    erb :'/books/index'
  end

  # new action
  get '/books/new' do

  end

  post '/books' do

  end

  # show action
  get '/books/:id' do

  end

  # edit action
  get '/books/:id/edit' do

  end

  patch '/books/:id' do

  end

  # delete action
  delete '/books/:id/delete' do
    
  end

end
