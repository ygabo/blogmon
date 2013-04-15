# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friendship do
    user_id 1
    friend_id 1
    create "MyString"
    destroy "MyString"
  end
end
