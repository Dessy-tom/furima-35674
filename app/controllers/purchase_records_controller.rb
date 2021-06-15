class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item
  before_action :sold_out

  def index
    redirect_to new_user_session_path unless current_user
    @purchase_record_destination = PurchaseRecordDestination.new
    if current_user == @item.user
      redirect_to root_path
    end
  end


  def create
    @purchase_record_destination = PurchaseRecordDestination.new(donation_params)
    if @purchase_record_destination.valid?
      pry_item
      @purchase_record_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def donation_params
    params.require(:purchase_record_destination).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pry_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: donation_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out
    redirect_to root_path if @item.purchase_record.present?
  end



end
