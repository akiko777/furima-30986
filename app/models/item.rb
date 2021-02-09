class Item < ApplicationRecord
  
  belongs_to       :user
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

  validates :price, format: { with: /\A[0-9]+\z/},
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

                    
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_day
  belongs_to :prefecture

end
