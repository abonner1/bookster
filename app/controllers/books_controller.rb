require 'rack-flash'

class BooksController < ApplicationController
  use Rack::Flash

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
    book = current_user.books.create(params[:book])
    if book.valid?
      redirect to "/books/#{book.id}"
    else
      flash[:error] = "Uh oh! Something wasn't filled in!\nTitle, author, priace, and availability are all required."
      redirect to '/books/new'
    end
  end

  # show action
  get '/books/:id' do
    if logged_in?
      @book = Book.find_by_id(params[:id])
      erb :'/books/show_book'
    else
      redirect to '/login'
    end
  end

  # edit action
  get '/books/:id/edit' do
    if logged_in?
      @book = Book.find_by_id(params[:id])
      erb :'/books/edit_book'
    else
      redirect '/login'
    end
  end

  patch '/books/:id' do
    book = Book.find_by_id(params[:id])
    book.update(params[:book])
    redirect to "/books/#{book.id}"
  end

  # delete action
  delete '/books/:id/delete' do
    book = current_user.books.find_by_id(params[:id])
    if book && book.destroy
      redirect '/books'
    else
      redirect to "/books/#{book.id}"
    end
  end

end
