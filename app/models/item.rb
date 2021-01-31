class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :condition_id
    validates :category_id
    validates :prefecture_id
    validates :shipping_fee_id
    validates :shipping_day_id
    validates :image
  end
  
end
