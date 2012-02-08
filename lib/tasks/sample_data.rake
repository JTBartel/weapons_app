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
  
  #"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    User.all(:limit => 2).each do |user|
      1.times do |n|
        weapontype          = "Rifle"
        weaponname          = "M1 Garand"
        weaponnickname      = "Ginger Dinger"
        weaponaction        = "Semi-Automatic"
        weaponimage         = "M1Rifle.jpg"
        caliber             = "30-06"
        caliberunit         = "cal"
        roundcap            = 8
        rateoffire          = 50
        rofunit             = "min"
        maxrange            = 1000
        maxrangeunit        = "yds"
        effectiverange      = 600
        effectiverangeunit  = "yds"
        origincountry       = "U.S.A."
        weaponyear          = 1936
        weaponapproval      = true
        user.weapons.create!( :weapon_type          => weapontype         ,
                              :weapon_name          => weaponname         ,
                              :weapon_nickname      => weaponnickname     ,
                              :weapon_action        => weaponaction       ,
                              :weapon_image         => weaponimage        ,
                              :caliber              => caliber            ,
                              :caliber_unit         => caliberunit        ,
                              :round_cap            => roundcap           ,
                              :rate_of_fire         => rateoffire         ,
                              :rof_unit             => rofunit            ,
                              :max_range            => maxrange           ,
                              :max_range_unit       => maxrangeunit       ,
                              :effective_range      => effectiverange     ,
                              :effective_range_unit => effectiverangeunit ,
                              :origin_country       => origincountry      ,  
                              :year_made            => weaponyear         ,
                              :weapon_approval      => weaponapproval     )
                              
      end
      55.times do |n|
        weapontype          = Faker::Name.name + " Type"
        weaponname          = Faker::Name.name + " Gun"
        weaponnickname      = "Nick" + Faker::Name.name
        weaponaction        = Faker::Name.first_name + " Action"
        caliber             = "#{n}"
        caliberunit         = "mm"
        roundcap            = 30 + n
        rateoffire          = 20 + n
        rofunit             = "min"
        maxrange            = 600 + n
        maxrangeunit        = "yds"
        effectiverange      = 200 + n
        effectiverangeunit  = "yds"
        origincountry       = "U.S.A."
        weaponyear          = 1900 + n
        weaponapproval      = true
        user.weapons.create!( :weapon_type          => weapontype         ,
                              :weapon_name          => weaponname         ,
                              :weapon_nickname      => weaponnickname     ,
                              :weapon_action        => weaponaction       ,
                              :caliber              => caliber            ,
                              :caliber_unit         => caliberunit        ,
                              :round_cap            => roundcap           ,
                              :rate_of_fire         => rateoffire         ,
                              :rof_unit             => rofunit            ,
                              :max_range            => maxrange           ,
                              :max_range_unit       => maxrangeunit       ,
                              :effective_range      => effectiverange     ,
                              :effective_range_unit => effectiverangeunit ,
                              :origin_country       => origincountry      ,  
                              :year_made            => weaponyear         ,
                              :weapon_approval      => weaponapproval     )
                              
      end
    end
  end
end
#  weapon_type          :string(255)
#  weapon_name          :string(255)
#  weapon_nickname      :string(255)
#  weapon_action        :string(255)
#  weapon_image         :string(255)
#  caliber              :string(255)
#  caliber_unit         :string(255)
#  round_cap            :integer
#  rate_of_fire         :integer
#  rof_unit             :string(255)
#  max_range            :integer
#  max_range_unit       :string(255)
#  effective_range      :integer
#  effective_range_unit :string(255)
#  origin_country       :string(255)
#  year_made            :integer
#  weapon_approval      :boolean         default(FALSE)