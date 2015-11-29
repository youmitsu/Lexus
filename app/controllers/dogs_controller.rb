class DogsController < ApplicationController

  def index
    @dogs = Dog.where(id: current_user.id)
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @types = DogType.all
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save!
      redirect_to dog_path(@dog)
    else
      render "new"
    end
  end

  private
    def dog_params
      params.require(:dog).permit(:user_id, :name, :age, :dog_type_id, :active, :hair, :bark, :tack, :comment, :image)
    end
end
