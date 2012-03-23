# rake db:populate
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "PG134",
                 :email => "perfectcombo555@aol.com",
                 :city => "Cary",
                 :state => "NC",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      city = Faker::Address.city
      state = Faker::Address.us_state_abbr
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :city => city,
                   :state => state,
                   :password => password,
                   :password_confirmation => password)
    end
    rifle = WeaponType.create!(:type_name => "Rifle")
    WeaponType.create!(:type_name => "Sub Machine Gun")
    WeaponType.create!(:type_name => "Light Machine Gun")
    WeaponType.create!(:type_name => "Sniper Rifle")
    WeaponType.create!(:type_name => "Hand Gun")
    WeaponType.create!(:type_name => "Launcher")
    WeaponType.create!(:type_name => "Shot Gun")
    WeaponType.create!(:type_name => "Armor")
    WeaponType.create!(:type_name => "Sword")
    WeaponType.create!(:type_name => "Bow")
    WeaponType.create!(:type_name => "Spear")
    WeaponType.create!(:type_name => "Tank")
    WeaponType.create!(:type_name => "Ship")
    WeaponType.create!(:type_name => "Aircraft")
    WeaponType.create!(:type_name => "Shields")
    WeaponType.create!(:type_name => "Other")
    rifle.weapons.create!(
      :weapon_name          => "M1 Garand"      ,
      :weapon_nickname      => "Ginger Dinger"  ,
      :weapon_action        => "Semi-Automatic" ,
      :caliber              => "30-06"          ,
      :caliber_unit         => "cal"            ,
      :round_cap            => 8                ,
      :rate_of_fire         => 50               ,
      :rof_unit             => "min"            ,
      :max_range            => 1000             ,
      :max_range_unit       => "yds"            ,
      :effective_range      => 600              ,
      :effective_range_unit => "yds"            ,
      :origin_country       => "U.S.A."         ,  
      :year_made            => 1936             ,
      :weapon_approval      => true             )
WeaponType.all.each do |weapon_type|
      6.times do |n|
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
        weapon_type.weapons.create!( 
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