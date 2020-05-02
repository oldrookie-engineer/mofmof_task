class RentsController < ApplicationController
  before_action :set_rent, only: [:show, :edit, :update, :destroy]

  def index
    @rents = Rent.all
  end

  def new
    @rent = Rent.new
    @rent.stations.build
  end

  def create
    @rent = Rent.new(rent_params)
    if @rent.save
      redirect_to new_rent_path, notice: '物件登録できました！'
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @rent.stations.last.route.blank? &&
      @rent.stations.last.station_name.blank? && @rent.stations.last.walk_time.blank?
      @rent.stations.build
    end
  end

  def update
    if @rent.update(rent_params)
      redirect_to rents_path, notice: '物件を編集できました！'
    else
      render :edit
    end
  end

  def destroy
    @rent.destroy
    redirect_to rents_path, notice: '物件を削除しました！'
  end

  private
  def  rent_params
    params.require(:rent).permit(:name, :price, :address, :age, :comment,stations_attributes:[:route, :station_name, :walk_time, :id, :_destroy])
  end

  def set_rent
    @rent = Rent.find(params[:id])
  end

end
