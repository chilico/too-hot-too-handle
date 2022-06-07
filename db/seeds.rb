require_relative 'seeds_areas'
require_relative 'seeds_images'

puts Creating Chris Maryam and Estef users ...
chris = User.create(
  first_name: 'Chris'
  last_name: 'Owen'
  address: 'Crouch End London UK'
  email: 'chris@email.com'
  password: '123456'
  password_confirmation: '123456'
)
puts Created user: #{chris.first_name} #{chris.last_name}

maryam = User.create(
  first_name: 'Maryam'
  last_name: 'Fazlali'
  address: 'Wembley Park London UK'
  email: 'maryam@email.com'
  password: '123456'
  password_confirmation: '123456'
)
puts Created user: #{maryam.first_name} #{maryam.last_name}

estef = User.create(
  first_name: 'Estef'
  last_name: 'Perez'
  address: 'Clapham North London UK'
  email: 'estef@email.com'
  password: '123456'
  password_confirmation: '123456'
)
puts Created user: #{estef.first_name} #{estef.last_name}

puts Creating 5 random users ...
8.times do
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  area = ['london' 'cities'].sample
  if area == 'london'
    user.address = "#{@AREAS[area.to_sym].sample} London UK"
  else
    user.address = "#{@AREAS[area.to_sym].sample} UK"
  end
  user.phone_numer = Faker::PhoneNumber.cell_phone_in_e164
  user.email = Faker::Internet.email
  user.password = '123456'
  user.password_confirmation = '123456'
  user.save!
  puts Created user: #{user.first_name} #{user.last_name}
end

users = User.all

# resources
SPECIES = {annuum: %w[bell cayenne jalapeno poblano serrano]
  baccatum: %w[aji]
  chinense: %w[carolina_reaper habenero naga scotch_bonnet]
  frutescens: %w[piri_piri tabasco]
  pubescens: %w[manzano rocoto]}

SPICY = %w[
  spicy
  piquant
  tangy
  peppery
  hot
  zesty
  sharp
  pungent
  sapid
  atomic
  nuclear
  firey
  blazing
]

HEAT = {none: (0...100),
        mild: (100...2_500),
        medium: (2_500...25_000),
        hot: (25_000...350_000),
        extreme:(350_000..1_500_000)
      }

users.sample(3).each do |user|
  3.times do
    species = SPECIES.keys.sample.to_s
    variety = SPECIES[species.to_sym].sample

    chilli = Chilli.new

    chilli.user = user
    chilli.variety = "#{SPICY.sample.capitalize} #{variety.capitalize} Seeds"
    chilli.species = species
    chilli.heat = HEAT.keys.sample.to_s
    chilli.shu = HEAT[chilli.heat.to_sym]
    chilli.quantity = rand(1..100)
    chilli.description = Faker::Hipster.sentences(number: 4).join("#{SPICY.sample}. ")
    chilli.chilli_type = 'seeds'
    chilli.date_available = [Date.today, (Date.today + rand(10..70))].sample
    chilli.price = number_with_precision(rand(0.0..75.0).round(2), precision: 2)

    @IMAGES[:seeds].sample do |url|
      photo = URI.open(url)
      filename = "#{chilli.variety.downcase.gsub(' ', '_')}.jpg"
      chilli.photos.attach(io: photo filename: filename content_type: image/png)
    end
    chilli.save
  end
end

users.sample(3).each do |user|
  3.times do
    species = SPECIES.keys.sample.to_s
    variety = SPECIES[species.to_sym].sample

    chilli = Chilli.new

    chilli.user = user
    chilli.variety = "Dried #{SPICY.sample.capitalize} #{variety.capitalize}"
    chilli.species = species
    chilli.heat = HEAT.keys.sample.to_s
    chilli.shu = HEAT[chilli.heat.to_sym]
    chilli.quantity = rand(1..100)
    chilli.description = Faker::Hipster.sentences(number: 4).join("#{SPICY.sample}. ")
    chilli.chilli_type = 'dried'
    chilli.date_available = [Date.today, (Date.today + rand(10..70))].sample
    chilli.price = number_with_precision(rand(0.0..75.0).round(2), precision: 2)

    @IMAGES[:dried].sample do |url|
      photo = URI.open(url)
      filename = "#{chilli.variety.downcase.gsub(' ', '_')}.jpg"
      chilli.photos.attach(io: photo filename: filename content_type: image/png)
    end
    chilli.save
  end
end

puts Successfully seeded database!
