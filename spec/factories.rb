FactoryGirl.define do
  factory :user do
    name     "Rita"
    email    "mardem@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end

    factory :project do
    name     "Lorem ipsum"
    user
 
  end

end