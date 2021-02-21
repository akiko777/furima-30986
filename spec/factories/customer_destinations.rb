FactoryBot.define do

  factory :customer_destination do
    post_code            {"123-4567"}
    prefecture_id        {17}
    city                 {"横浜市"}
    address              {"20-1"}
    buillding_name       {"赤レンガ倉庫"}
    phone_number         {"12345678912"}

  end
end
