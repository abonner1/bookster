class BooksController < ApplicationController

  # index action
  get '/books' do
    if logged_in?
      @books = Book.all
      erb :'/books/index'
    else
      redirect to '/login'
    end
  end

  # new action
  get '/books/new' do
    if logged_in?
      erb :'/books/create_book'
    else
      redirect to '/login'
    end
  end

  post '/books' do
    @book = current_user.books.create(params[:book])
    redirect to "/books/#{@book.id}"
  end

  # show action
  get '/books/:id' do
    @book = Book.find_by_id(params[:id])
    erb :'/books/show_book'
  end

  # edit action
  get '/books/:id/edit' do
    @book = Book.find_by_id(params[:id])
    erb :'/books/edit_book'
  end

  patch '/books/:id' do
    @book = Book.find_by_id(params[:id])
    @book.update(params[:book])
    redirect to "/books/#{@book.id}"
  end

  # delete action
  delete '/books/:id/delete' do
    @book = Book.find_by_id(params[:id])
    @book.delete
    redirect '/books'
  end

end
