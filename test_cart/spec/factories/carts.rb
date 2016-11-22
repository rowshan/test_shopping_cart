FactoryGirl.define do
  factory :cart do
    product_name {"ProductName#{SecureRandom.hex}"}
    category {"CategorName#{SecureRandom.hex}"}
  end
end
