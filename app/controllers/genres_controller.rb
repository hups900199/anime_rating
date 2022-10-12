class GenresController < ApplicationController
  def index
    @genres = Genre.includes(:animes).all.order("name DESC")
  end
end
