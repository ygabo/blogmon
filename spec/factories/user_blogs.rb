# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_blog do
    user_id 1
    post_id 1
    create "MyString"
    destroy "MyString"
  end
end
