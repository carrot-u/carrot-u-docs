# This will guess the Order class
FactoryBot.define do
  factory :order do
    items ["Chicken Breast", "Egg Whites", "White Rice", "Spinach"]
    warehouse "Costco"
    total 49.99
    workflow_state "brand_new"
  end

  factory :customer do
    name "Buffy Summers"
    email "chosen1@btvs.com"
    phone 8057305276
    street_address "1630 Revello Drive"
    city "Sunnydale"
    state "CA"
    postal_code "93101"
    valid_payment_method true
    express_member false
  end

  factory :driver do
    name "Jeremy Flanagan"
    email "jeremy@instacart.com"
    phone 4151234567
    drivers_license_number "D9876543"
    drivers_license_state "CA"
    vehicle_license_plate "BB848269"
    background_check_clear true
  end
end
