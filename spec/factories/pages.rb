# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :title do |n|
    "MyTitle#{n}"
  end
  factory :page do
    title
    content "MyText"
    published_on "2012-09-08 20:46:38"
  end
end
