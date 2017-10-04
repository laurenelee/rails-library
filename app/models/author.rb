class Author < ApplicationRecord
  has_many :books

  def first_published
    return books.order(:publication_year).first.publication_year
  end
end
