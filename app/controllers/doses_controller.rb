class DosesController < ApplicationController
  def index
    @doses = Dose.all
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(user_params)
    @dose.cocktail_id = @cocktail.id
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end

# params[:dose][:description]
# params[:dose][:ingredient_id]
