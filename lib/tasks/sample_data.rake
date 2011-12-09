# rake db:populate
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "PG134",
                 :email => "perfectcombo555@aol.com",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  
  
    User.all(:limit => 2).each do |user|
      55.times do |n|
        weaponname         = Faker::Name.name + " Gun"
        weapontype         = Faker::Name.name + " Type"
        user.weapons.create!( :weapon_name         => weaponname  ,
                              :weapon_type         => weapontype  )
      end
    end
  end
end