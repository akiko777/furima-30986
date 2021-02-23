require 'rails_helper'

RSpec.describe CustomerDestination, type: :model do
   describe '商品の購入' do
      before do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.create(:item)
        @customer_destination = FactoryBot.build(:customer_destination, user_id:@user.id, item_id:@item.id)
        sleep 0.1
      end

      it '必要な情報を適切に入力すると商品の購入ができること' do
        expect(@customer_destination).to be_valid
      end

      it '郵便番号が空だと購入できない' do
        @customer_destination.post_code = nil
        @customer_destination.valid?
        expect(@customer_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は半角のハイフンを含んだ正しい形式でないと保存できない' do
        @customer_destination.post_code = "123456"
        @customer_destination.valid?
        expect(@customer_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '市区町村が空だと購入できない' do
        @customer_destination.city = nil
        @customer_destination.valid?
        expect(@customer_destination.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @customer_destination.address = nil
        @customer_destination.valid?
        expect(@customer_destination.errors.full_messages).to include("Address can't be blank")
      end
      it '建物名は空でも保存できる' do
        @customer_destination.buillding_name = nil
        expect(@customer_destination).to be_valid
      end
      it '電話番号が空だと購入できない' do
        @customer_destination.phone_number = nil
        @customer_destination.valid?
        expect(@customer_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンが入っていると保存できない' do
        @customer_destination.phone_number = "090-1234-5678"
        @customer_destination.valid?
        expect(@customer_destination.errors.full_messages).to include("Phone number Input only number")
      end
      it '電話番号は半角数字でないと保存できない' do
        @customer_destination.phone_number = "０９０１２３４５６７８"
        @customer_destination.valid?
        expect(@customer_destination.errors.full_messages).to include("Phone number Input only number")
      end
      it '電話番号が12桁以上の場合は保存できない' do
        @customer_destination.phone_number = "090123456789"
        @customer_destination.valid?
        expect(@customer_destination.errors.full_messages).to include("Phone number Input only number")
      end
      it 'tokenが空では登録できない'do
        @customer_destination.token = nil
        @customer_destination.valid?
        expect(@customer_destination.errors.full_messages).to include("Token can't be blank")
      end
   end
end