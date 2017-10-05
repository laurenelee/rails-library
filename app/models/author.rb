class Author < ApplicationRecord
  has_many :books

  # This is a comment! I'm commenting
  def first_published
    first_book = books.order(:publication_year).first
    return first_book ? first_book.publication_year : nil
  end

  # Override the ActiveRecord version to destroy
  # dependent records as well
  def destroy
    puts "Destroying all books for author #{id}"
    books.destroy_all
    super
  end
end
