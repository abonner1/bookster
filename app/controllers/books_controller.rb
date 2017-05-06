class BooksController < ApplicationController

  get '/books' do
    @books = Book.all
    erb :'/books/index'
  end

end
