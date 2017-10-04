class Author < ApplicationRecord
  has_many :books

  # This is a comment! I'm commenting
  def first_published
    return books.order(:publication_year).first.publication_year
  end
end
