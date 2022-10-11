class HomeController < ApplicationController
  def index
    @animes = Anime.includes(:type)
                   .order("rating DESC")
                   .limit(10)
  end
end
