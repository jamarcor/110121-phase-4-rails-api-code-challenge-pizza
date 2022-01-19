class RestaurantsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :oopsies

    def index
        render json: Restaurant.all, status: :ok
    end

    def show
        render json: find_restaurant, status: :ok,
        serializer: PizzaRestaurantsSerializer
    end

    def destroy
        restaurant = find_restaurant
        restaurant.destroy
        head :no_content, status: :ok
    end

    private

    def find_restaurant
        Restaurant.find(params[:id])
    end

    def oopsies
        render json: { "error": "Restaurant not found" }, status: :not_found
    end

end
