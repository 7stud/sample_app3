FactoryGirl.define do
  factory :user do
    name      "Diane V"
    email     'b@yahoo.com'
    password  'foobar'
    password_confirmation 'foobar'
  end
end
