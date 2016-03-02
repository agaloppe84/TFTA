class DishesController < ApplicationController
end

 skip_before_action :authenticate_user!, only: [:index, :show, :create]
 before_action :set_dish, only: [:show, :edit, :update, :destroy]



def index
    @dishs = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def new
    @dish = dish.new
  end

  def edit
    @dish.save
  end

 def update
    @dish = Dish.find(params[:id])
    if @dish.update(dish_params)
      redirect_to #dish_path(@dish)
    else
      render :edit
    end
    # Will raise ActiveModel::ForbiddenAttributesError
  end
 end

  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy
<<<<<<< 88c4133be50994b7782f9bf32097dc2e36d2de78
    redirect_to dishes_path # route a verifier
=======
    redirect_to dishes_path
>>>>>>> controller dishes et views
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name, :description, :price, :picture, :address)
  end


end
