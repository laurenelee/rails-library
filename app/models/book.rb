# app/models/book.rb
class Book < ApplicationRecord
  #Already done for us: attr_accessor :title, :author, :description

  belongs_to :author

end
