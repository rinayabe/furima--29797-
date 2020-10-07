class Item < ApplicationRecord
  has_one_attached :image
  #validates :image, presence: true

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :area_id
    validates :days_id
    PRICE_REGEX = /\A[0-9]+\z/
    validates :price, inclusion: { in: (300..9999999)},
                      format: { with: PRICE_REGEX }
    validates :user_id
  end
end
