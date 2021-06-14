class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item

  def index
    @purchase_record_destination = PurchaseRecordDestination.new
  end


  def create
    @purchase_record_destination = PurchaseRecordDestination.new(donation_params)
    if @purchase_record_destination.valid?
      @purchase_record_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def donation_params
    params.require(:purchase_record_destination).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


end
