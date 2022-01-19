class RestaurantPizzasController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :bad

def create
    restaurant_pizza = RestaurantPizza.create!(pizza_params)
    render json: restaurant_pizza.pizza, status: :created
end

private

def pizza_params
    params.permit(:pizza_id, :restaurant_id, :price)
end

def bad (e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
end

end