FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Some Rationale"
    user
  end
end
