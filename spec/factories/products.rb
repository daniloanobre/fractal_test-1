FactoryGirl.define do
  factory :product do
    name Faker::Name.name
    supplier
    place
    categories { |a| [a.association(:category)] }

    # after(:create) do |user, evaluator|
    #   create_list(:site, :rejected, 1, users: [user])
    #   create_list(:site, :processing, 1, users: [user])
    # end
  end
end
