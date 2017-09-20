class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new #Only cares about showing the form

  end

  def create #Has access to user data, from the form
    # Before, using a hand-rolled form, the format of data coming off
    # the wire was different, so the way we pulled it out was also different:
    # book = Book.new(title: params[:title], author: params[:author])

    book = Book.new(title: params[:book][:title], author: params[:book][:author])

    # Equivalent to:
    # book = Book.new
    # book.title = params[:book][:title]
    # book.author = params[:book][:author]

    book.save
    redirect_to('/books')
  end

  def show
    @book = Book.find(params[:id])
    # @book = Book.find_by(title: params[:book_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
