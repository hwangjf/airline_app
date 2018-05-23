class DestinationsController < ApplicationController
  before_action :get_destination, only: [:show, :edit, :update, :destroy]
  before_action :get_airlines, only: [:new, :edit]

  def index
    @destinations = Destination.all
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.create(destination_params)
    if @destination.valid?
      redirect_to @destination
    else
      flash[:errors] = @destination.errors.full_messages
      redirect_to new_destination_path
    end
  end

  def show
    byebug
  end

  def edit
  end

  def update
    @destination = Destination.update(destination_params)
    if @destination.valid?
      redirect_to @destination
    else
      flash[:errors] = @destination.errors.full_messages
      redirect_to edit_destination_path
    end
  end

  def destroy
    @destination.destroy
    redirect_to destinations_path
  end

  private

  def destination_params
    params.require(:destination).permit(:city, airline_ids: [])
  end

  def get_destination
    @destination = Destination.find(params[:id])
  end

  def get_airlines
    @airlines = Airline.all
  end

end
