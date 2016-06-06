class RestaurantsController  < ApplicationController 
  def index
    @restaurants = Restaurant.all
  end
  
  def show
    @restaurant = Restaurant.find_by_id(params[:id])
  end
  
  def new
    @restaurant = Restaurant.new 
  end
  
  def create
    @restaurant = Restaurant.new(restaurant_params)
    
    if @restaurant.save
      flash[:notice] = 'Restaurant was saved successfully'
       redirect_to restaurants_path
    else
      flash.now[:error] = 'There was a problem saving this Restaurant'
      render :new
    end
  end
  
  def edit 
    @restaurant = Restaurant.find_by_id(params[:id])  
  end
  
  def update
    @restaurant = Restaurant.find_by_id(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant), notice: 'Restaurant was updated successfully'    
    else
      flash.now[:error] = "There was an issue updating this Restaurant"
      render :edit
    end
  end
  
  def destroy 
    @restaurant = Restaurant.find_by_id(params[:id]) 

    @restaurant.delete

    redirect_to restaurants_path
  end

  private
  
  def restaurant_params
    params.require(:restaurant).permit(:name, :street, :city, :state, :country, :postal_code, :neighborhood_id, :category_ids => [])
  end

end
