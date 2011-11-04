# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "PG134"
  user.email                 "PG@134.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end