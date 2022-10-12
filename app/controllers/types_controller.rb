class TypesController < ApplicationController
  def index
    @types = Type.includes(:animes).all.order("name DESC")
  end
end
