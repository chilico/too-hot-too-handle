require_relative 'seeds_areas'
require_relative 'seeds_images'
require_relative 'seeds_heat'

# resources constants
SPECIES = {
  annuum: %w[bell cayenne jalapeno poblano serrano],
  baccatum: %w[aji],
  chinense: %w[carolina_reaper habenero naga scotch_bonnet],
  frutescens: %w[piri_piri tabasco],
  pubescens: %w[manzano rocoto]
}

# SPICY = %w[
#   spicy
#   piquant
#   tangy
#   peppery
#   hot
#   zesty
#   sharp
#   pungent
#   sapid
#   atomic
#   nuclear
#   firey
#   blazing
# ]

SPICY = {
  none: %w[
    piquant
    tangy
    peppery
    zesty
    pungent
    sapid
  ],
  mild: %w[
    piquant
    tangy
    peppery
    zesty
    sharp
    pungent
    sapid
  ],
  medium: %w[
    spicy
    tangy
    hot
    zesty
    sharp
    pungent
    sapid
  ],
  hot: %w[
    spicy
    peppery
    hot
    sapid
    firey
    blazing
  ],
  extreme: %w[
    sapid
    atomic
    nuclear
    firey
    blazing
  ]
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
puts 'Seeding 1 to 3 chilli seeds for 3 users'
users.sample(4).each do |user|
  rand(1..3).times do
    species = SPECIES.keys.sample.to_s
    variety = SPECIES[species.to_sym].sample
    heat = @CHILLI_SHU[species.to_sym][variety.to_sym].keys[0]

    chilli = Chilli.new
    chilli.user = user

    if rand(0..1.0).round(1) > 0.6
      chilli.variety = "#{variety.capitalize.gsub('_', ' ')}"
    else
      chilli.variety = "#{SPICY[heat].sample.capitalize} #{variety.capitalize.gsub('_', ' ')}"
    end

    chilli.species = species
    chilli.heat = heat.to_s
    chilli.shu = @CHILLI_SHU[species.to_sym][variety.to_sym][heat].to_a.sample
    chilli.quantity = rand(1..100)
    chilli.description = Faker::Hipster.sentences(number: 4).join(" #{SPICY[heat].sample.capitalize}. ")
    chilli.chilli_type = 'seeds'
    chilli.date_available = [Date.today, (Date.today + rand(10..70))].sample
    chilli.price = rand(0.0..20.0).round(2)

    photo = URI.open(@IMAGES[:seeds].shuffle.sample)
    filename = "#{chilli.variety.downcase.gsub(' ', '_')}.jpg"
    chilli.photos.attach(io: photo, filename: filename, content_type: 'image/png')

    chilli.save
  end
end

@IMAGES[:seeds].shuffle.sample

# dried chillies
puts 'Seeding 1 to 3 dried chillies for 3 users'
users.sample(4).each do |user|
  rand(1..3).times do
    species = SPECIES.keys.sample.to_s
    variety = SPECIES[species.to_sym].sample
    heat = @CHILLI_SHU[species.to_sym][variety.to_sym].keys[0]

    chilli = Chilli.new
    chilli.user = user

    if rand(0..1.0).round(1) > 0.6
      chilli.variety = "#{variety.capitalize.gsub('_', ' ')}"
    else
      chilli.variety = "#{SPICY[heat].sample.capitalize} #{variety.capitalize.gsub('_', ' ')}"
    end

    chilli.species = species
    chilli.heat = heat.to_s
    chilli.shu = @CHILLI_SHU[species.to_sym][variety.to_sym][heat].to_a.sample
    chilli.quantity = rand(1..100)
    chilli.description = Faker::Hipster.sentences(number: 4).join(" #{SPICY[heat].sample.capitalize}. ")
    chilli.chilli_type = 'dried'
    chilli.date_available = [Date.today, (Date.today + rand(10..70))].sample
    chilli.price = rand(0.0..20.0).round(2)

    photo = URI.open(@IMAGES[:dried].shuffle.sample)
    filename = "#{chilli.variety.downcase.gsub(' ', '_')}.jpg"
    chilli.photos.attach(io: photo, filename: filename, content_type: 'image/png')

    chilli.save
  end
end

# fresh chillies
puts 'Seeding 4 fresh chillies for each user'
users.each do |user|
  4.times do
    species = SPECIES.keys.sample.to_s
    variety = SPECIES[species.to_sym].sample
    heat = @CHILLI_SHU[species.to_sym][variety.to_sym].keys[0]

    chilli = Chilli.new
    chilli.user = user

    if rand(0..1.0).round(1) > 0.6
      chilli.variety = "#{variety.capitalize.gsub('_', ' ')}"
    else
      chilli.variety = "#{SPICY[heat].sample.capitalize} #{variety.capitalize.gsub('_', ' ')}"
    end

    chilli.species = species
    chilli.heat = heat.to_s
    chilli.shu = @CHILLI_SHU[species.to_sym][variety.to_sym][heat].to_a.sample
    chilli.quantity = rand(1..100)
    chilli.description = Faker::Hipster.sentences(number: 4).join(" #{SPICY[heat].sample.capitalize}. ")
    chilli.chilli_type = 'fresh'
    chilli.date_available = [Date.today, (Date.today + rand(10..70))].sample
    chilli.price = rand(0.0..20.0).round(2)

    @IMAGES[:fresh][species.to_sym][variety.to_sym].shuffle.sample(4).each_with_index do |url, i|
      photo = URI.open(url)
      filename = "#{chilli.variety.downcase.gsub(' ', '_')}_#{i}.jpg"
      chilli.photos.attach(io: photo, filename: filename, content_type: 'image/png')
    end

    chilli.save
  end
end

puts 'Successfully seeded database!'
