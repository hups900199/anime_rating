class AnimeController < ApplicationController
  def index
    @animes = Anime.includes(:type).all.order("rating DESC").page params[:page]
  end

  def show
    @anime = Anime.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    search_type     = params[:type]
    #debugger.log(wildcard_search)

    if search_type != ""
      @totals = Anime.where("name LIKE ?", wildcard_search).where(type_id: search_type)
      @animes = Anime.where("name LIKE ?", wildcard_search).where(type_id: search_type).order("rating DESC").page params[:page]
    else
      @totals = Anime.where("name LIKE ?", wildcard_search)
      @animes = Anime.where("name LIKE ?", wildcard_search).order("rating DESC").page params[:page]
    end
  end
end
