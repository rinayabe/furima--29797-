class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :area
  belongs_to_active_hash :days

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :area_id
    validates :days_id
    PRICE_REGEX = /\A[0-9]+\z/.freeze
    validates :price, inclusion: { in: (300..9_999_999) },
                      format: { with: PRICE_REGEX }
    validates :user_id
  end
end
