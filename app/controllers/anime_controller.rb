class AnimeController < ApplicationController
  def index
    @animes = Anime.includes(:type).all.order("rating DESC")
  end

  def show
    @anime = Anime.find(params[:id])
  end
end
