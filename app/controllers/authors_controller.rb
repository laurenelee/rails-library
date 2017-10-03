class AuthorsController < ApplicationController
  def index
    @authors = Author.all.order(:nationality, :name)
  end

  def new
  end

  def create
  end
end
