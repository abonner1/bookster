require 'rack-flash'

class BooksController < ApplicationController
  use Rack::Flash

  # index action
  get '/books' do
    authenticate_user
    @books = Book.all
    erb :'/books/index'
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
    book = current_user.books.build(params[:book])
    if book.valid? && book.save
      redirect to "/books/#{book.id}"
    else
      flash[:error] = book.errors.full_messages.join(', ')
      redirect to '/books/new'
    end
  end

  # show action
  get '/books/:id' do
    authenticate_user
    @book = Book.find_by_id(params[:id])
    erb :'/books/show_book'
  end

  # edit action
  get '/books/:id/edit' do
    authenticate_user
    @book = Book.find_by_id(params[:id])
    if current_user == @book.user
      erb :'/books/edit_book'
    else
      redirect '/books'
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
