class BooksController < ApplicationController

  # index action
  get '/books' do
    @books = Book.all
    erb :'/books/index'
  end

  # new action
  get '/books/new' do
    erb :'/books/create_book'
  end

  post '/books' do
    @book = Book.create(params)
    redirect to "/books/#{book.id}"
  end

  # show action
  get '/books/:id' do
    @book = Book.find_by_id(params[:id])
    erb :'/books/show'
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
