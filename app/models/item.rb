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
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_day_id
    validates :prefecture_id
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_day
  belongs_to :prefecture

end
