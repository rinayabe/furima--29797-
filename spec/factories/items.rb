FactoryBot.define do
  factory :item do
    name                 { 'aaa' }
    explain              { 'あいう' }
    category_id          { '2' }
    condition_id         { '3' }
    fee_id               { '2' }
    area_id              { '2' }
    days_id              { '2' }
    price                { '500' }
    user_id { '5' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'test_image.png')
    end
  end
end
