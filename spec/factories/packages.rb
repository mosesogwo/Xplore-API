FactoryBot.define do
  factory :package do
    destination { "MyString" }
    price { "9.99" }
    details { "MyText" }
    after(:build) do |culture|
      culture.images.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/jpeg')
    end
  end
end
