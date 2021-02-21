class CustomerDestination
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :address, :buillding_name, :phone_number


  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: "Input only number" }
  end

    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    #購入の情報を保存
    customer = Customer.create(item_id: item_id, user_id: user_id)

    #住所の情報を保存
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, buillding_name: buillding_name, phone_number: phone_number, customer_id: customer.id )
  end

end
