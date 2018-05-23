class AirlinesController < ApplicationController
  before_action :get_airline, only: [:show, :edit, :update, :destroy]
  before_action :get_destinations, only: [:new, :edit]

  def index
    @airlines = Airline.all
  end

  def new
    @airline = Airline.new
  end

  def create
    @airline = Airline.create(airline_params)
    if @airline.valid?
      redirect_to @airline
    else
      flash[:errors] = @airline.errors.full_messages
      redirect_to new_airline_path
    end
  end

  def show
    byebug
  end

  def edit
  end

  def update
    @airline = Airline.update(airline_params)
    if @airline.valid?
      redirect_to @airline
    else
      flash[:errors] = @airline.errors.full_messages
      redirect_to edit_airline_path
    end
  end

  def destroy
    @airline.destroy
    redirect_to airlines_path
  end

  private

  def airline_params
    params.require(:airline).permit(:name, destination_ids: [])
  end

  def get_airline
    @airline = Airline.find(params[:id])
  end

  def get_destinations
    @destinations = Destination.all
  end

end
