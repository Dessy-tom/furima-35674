FactoryBot.define do
  factory :purchase_record_destination do
    post_code { '123-4567' }
    shipping_area_id { 2 }
    city { '上田市' }
    address { "aaa" }
    building_name  { 'あああ' }
    phone_number  { 19018667458 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
