require 'rails_helper'

RSpec.describe PurchaseRecordDestination, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_record_destination = FactoryBot.build(:purchase_record_destination, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '購入できるとき' do
      it '全てのフォームが入力されている' do
        expect(@purchase_record_destination).to be_valid
      end
      it '建物名がからの場合でも保存できる' do
        @purchase_record_destination.building_name = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination).to be_valid
      end
    end

    context '商品を購入できないとき' do
      it '郵便番号が空では登録できない' do
        @purchase_record_destination.post_code = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号はハイフンが入った正しい形でないと保存できない' do
        @purchase_record_destination.post_code = '1234567'
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が１だと保存できない' do
        @purchase_record_destination.shipping_area_id = '1'
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it '市町村が空では保存できない' do
        @purchase_record_destination.city = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @purchase_record_destination.address = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @purchase_record_destination.phone_number = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が英数混合では登録できない' do
        @purchase_record_destination.phone_number = '0000000000q'
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Phone number is not a number")
      end
      it '電話番号が11桁以内の数値でなければ保存できない' do
        @purchase_record_destination.phone_number = '000000000000'
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it "user_id が空では登録できないこと" do
        @purchase_record_destination.user_id = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("User can't be blank")
      end
      it "item_id が空では登録できないこと" do
        @purchase_record_destination.item_id = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
