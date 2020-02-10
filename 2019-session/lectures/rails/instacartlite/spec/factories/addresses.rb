FactoryBot.define do
  factory :address do
    user { nil }
    street { "MyText" }
    city { "MyText" }
    state { "MyText" }
    zip_code { "MyText" }
    active { false }
  end
end
