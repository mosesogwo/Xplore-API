FactoryBot.define do
  factory :package do
    destination { Faker::Nation }
    price { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    details { Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4) }
    after(:build) do |package|
      package.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/jpeg')
    end
  end
end
