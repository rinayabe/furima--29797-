FactoryBot.define do
  factory :order_place do
    token                { 'aaa' }
    post_code            { '123-4567' }
    area_id              { '2' }
    city                 { 'あいう' }
    address              { '333' }
    phone_number         { '00000000000' }
  end
end
