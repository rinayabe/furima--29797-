class OrderPlace
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  # VALID_CARD_NUMBER_REGEX = /\A\d{14,16}\z/
  # VALID_YAER_REGEX = /\A\d{2}\z/
  # VALID_MONTH_REGEX = /\A\d{2}\z/
  # VALID_CVC_REGEX = /\A\d{3,4}\z/
  with_options presence: true do
    validates :token
    VALID_POST_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
    validates :post_code, format: { with: VALID_POST_CODE_REGEX }
    validates :area_id
    validates :city
    validates :address
    VALID_PHONE_NUMBER_REGEX = /\A\d{,11}\z/.freeze
    validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Place.create(post_code: post_code, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
