require_relative 'seeds_areas'
require_relative 'seeds_images'

# resources constants
SPECIES = {
  annuum: %w[bell cayenne jalapeno poblano serrano],
  baccatum: %w[aji],
  chinense: %w[carolina_reaper habenero naga scotch_bonnet],
  frutescens: %w[piri_piri tabasco],
  pubescens: %w[manzano rocoto]
}

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

# users
puts 'Creating Chris, Maryam and Estef users ...'
chris = User.create(
  first_name: 'Chris',
  last_name: 'Owen',
  address: 'Crouch End, London, UK',
  email: 'chris@email.com',
  password: '123456',
  password_confirmation: '123456'
)
puts "Created user: #{chris.first_name} #{chris.last_name}"

maryam = User.create(
  first_name: 'Maryam',
  last_name: 'Fazlali',
  address: 'Wembley Park, London, UK',
  email: 'maryam@email.com',
  password: '123456',
  password_confirmation: '123456'
)
puts "Created user: #{maryam.first_name} #{maryam.last_name}"

estef = User.create(
  first_name: 'Estef',
  last_name: 'Perez',
  address: 'Clapham North, London, UK',
  email: 'estef@email.com',
  password: '123456',
  password_confirmation: '123456'
)
puts "Created users: #{estef.first_name} #{estef.last_name}"

puts 'Creating 8 random users ...'
8.times do
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  area = ['london', 'cities'].sample
  if area == 'london'
    user.address = "#{@AREAS[area.to_sym].sample}, London, UK"
  else
    user.address = "#{@AREAS[area.to_sym].sample}, UK"
  end
  user.phone_number = Faker::PhoneNumber.cell_phone_in_e164
  user.email = Faker::Internet.email
  user.password = '123456'
  user.password_confirmation = '123456'
  user.save!
  puts "Created user: #{user.first_name} #{user.last_name}"
end

users = User.all

# chilli seeds
users.sample(4).each do |user|
  rand(1..3).times do
    species = SPECIES.keys.sample.to_s
    variety = SPECIES[species.to_sym].sample

    chilli = Chilli.new

    chilli.user = user
    chilli.variety = "#{SPICY.sample.capitalize} #{variety.capitalize.gsub('_', ' ')}"
    chilli.species = species
    chilli.heat = HEAT.keys.sample.to_s
    chilli.shu = "#{HEAT[chilli.heat.to_sym].min}-#{HEAT[chilli.heat.to_sym].max + 1}"
    chilli.quantity = rand(1..100)
    chilli.description = Faker::Hipster.sentences(number: 4).join(" #{SPICY.sample.capitalize}. ")
    chilli.chilli_type = 'seeds'
    chilli.date_available = [Date.today, (Date.today + rand(10..70))].sample
    chilli.price = rand(0.0..20.0).round(2)

    photo = URI.open(@IMAGES[:seeds].sample)
    filename = "#{chilli.variety.downcase.gsub(' ', '_')}.jpg"
    chilli.photos.attach(io: photo, filename: filename, content_type: 'image/png')

    chilli.save
  end
end

# dried chillies
users.sample(4).each do |user|
  rand(1..3).times do
    species = SPECIES.keys.sample.to_s
    variety = SPECIES[species.to_sym].sample

    chilli = Chilli.new

    chilli.user = user
    chilli.variety = "#{SPICY.sample.capitalize} #{variety.capitalize.gsub('_', ' ')}"
    chilli.species = species
    chilli.heat = HEAT.keys.sample.to_s
    chilli.shu = "#{HEAT[chilli.heat.to_sym].min}-#{HEAT[chilli.heat.to_sym].max + 1}"
    chilli.quantity = rand(1..100)
    chilli.description = Faker::Hipster.sentences(number: 4).join(" #{SPICY.sample.capitalize}. ")
    chilli.chilli_type = 'dried'
    chilli.date_available = [Date.today, (Date.today + rand(10..70))].sample
    chilli.price = rand(0.0..20.0).round(2)

    photo = URI.open(@IMAGES[:dried].sample)
    filename = "#{chilli.variety.downcase.gsub(' ', '_')}.jpg"
    chilli.photos.attach(io: photo, filename: filename, content_type: 'image/png')

    chilli.save
  end
end

# fresh chillies
users.each do |user|
  4.times do
    species = SPECIES.keys.sample.to_s
    variety = SPECIES[species.to_sym].sample

    chilli = Chilli.new

    chilli.user = user
    chilli.variety = "#{SPICY.sample.capitalize} #{variety.capitalize.gsub('_', ' ')}"
    chilli.species = species
    chilli.heat = HEAT.keys.sample.to_s
    chilli.shu = HEAT[chilli.heat.to_sym].to_a.sample
    chilli.quantity = rand(1..100)
    chilli.description = Faker::Hipster.sentences(number: 4).join(" #{SPICY.sample.capitalize}. ")
    chilli.chilli_type = 'fresh'
    chilli.date_available = [Date.today, (Date.today + rand(10..70))].sample
    chilli.price = rand(0.0..20.0).round(2)

    @IMAGES[:fresh][species.to_sym][variety.to_sym].sample(4).each_with_index do |url, i|
      photo = URI.open(url)
      filename = "#{chilli.variety.downcase.gsub(' ', '_')}_#{i}.jpg"
      chilli.photos.attach(io: photo, filename: filename, content_type: 'image/png')
    end

    chilli.save
  end
end

puts 'Successfully seeded database!'

# manual (rails c) fix for underscores in name
# Chilli.all.each {|i| i.variety = i.variety.gsub('_', ' ') ; i.save}
