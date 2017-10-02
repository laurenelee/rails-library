class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new #Only cares about showing the form
    @book = Book.new
  end

  def create #Has access to user data, from the form
    # Before, using a hand-rolled form, the format of data coming off
    # the wire was different, so the way we pulled it out was also different:
    # book = Book.new(title: params[:title], author: params[:author])

    @book = Book.new(title: params[:book][:title])
    @book.author_id = params[:book][:author_id]

    # Equivalent to:
    # book = Book.new
    # book.title = params[:book][:title]
    # book.author = params[:book][:author]

    if @book.save
      redirect_to('/books')
    else
      # Tell the user what went wrong
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
    # @book = Book.find_by(title: params[:book_id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.author = params[:book][:author]
    @book.title = params[:book][:title]
    @book.save
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    # Always use destroy! Delete will create weird bugs for you.
    # @book.delete
    @book.destroy
    redirect_to books_path
  end
end
