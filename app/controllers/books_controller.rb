class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new #Only cares about showing the form

  end

  def create #Has access to user data, from the form
    book = Book.new(title: params[:title], author: params[:author])
    book.save
    redirect_to('/books')
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
