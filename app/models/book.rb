# app/models/book.rb
class Book < ApplicationRecord

  # This is no longer a conflict!

  belongs_to :author

  validates :title, presence: true, uniqueness: { message: "The title was not unique! Please choose a different one" }
  validates :description, length: { maximum: 500, message: "The description is too long" }

end
