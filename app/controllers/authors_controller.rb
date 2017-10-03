class AuthorsController < ApplicationController
  def index
    puts ">>>>>>>>>> DPR"
    puts "Sorting using 'order'"
    @authors = Author.all.order(:nationality, :name)

    puts "Sorting using 'sort'"
    @authors = Author.all.sort_by do |author|
      author.name
    end
    puts "done"
  end

  def new
  end

  def create
  end
end
