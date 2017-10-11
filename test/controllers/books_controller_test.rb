require "test_helper"

describe BooksController do

  describe "index" do
    # positive test:
    it "returns a success status for all books" do
      get books_path
      must_respond_with :success
    end

    # test the nested routes
    it "success if valid author_id" do
      get author_books_path(Author.first)
      must_respond_with :success
    end
    it "returns something when given a bad author_id" do
      bad_author_id = Author.last.id + 1
      get author_books_path(bad_author_id)
      must_respond_with :not_found
    end

    # what if there aren't any books?
    it "will return a success status when there are no books " do
      Book.destroy_all
      get books_path
      must_respond_with :success
    end

  end

  describe "new" do

  end

  describe "create" do
    #the book we created is valid # positive test
    it "does something when the book data is valid" do
      book_data = {
        book: {
          title: "test book",
          author_id: Author.first.id
        }
      }
      Book.new(book_data[:book]).must_be :valid?
      start_book_count = Book.count

      post books_path, params: book_data
      must_respond_with :redirect
      must_redirect_to books_path
      Book.count.must_equal start_book_count + 1
    end

    it "does something when the book data is invalid" do

    end

  end

  describe "edit" do

  end

  describe "update" do

  end

  describe "destroy" do

  end
end
