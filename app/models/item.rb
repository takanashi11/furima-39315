class Item < ApplicationRecord
  belongs_to :user
  #has_one    :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :cetegory
  belongs_to :day_to_ship
  belongs_to :detail
  belongs_to :profecture
  belongs_to :region

  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :day_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :detail_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :profecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :detail, presence: true
  validates :prefecture_id, presence: true
  validates :region_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :price, presence: true
end
