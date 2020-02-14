class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(user_params)
    # @ingredient = params[:cocktail][:ingredient_ids]
    @cocktail.save
    redirect_to cocktails_path
  end

  private

  def user_params
    params.require(:cocktail).permit(:name)
  end
end
