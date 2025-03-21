# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.create!([
  {
    name: 'BugSmash',
    location: 'Denver, CO',
    price: 0.00,
    starts_at: 30.days.from_now,
    description: %{
      Join us for a fun evening of bug smashing! It's a great
      way to get involved in open source projects whether you're
      reporting bugs, fixing bugs, or even creating
      a few bugs!
    }.squish,
    capacity: 25
  },
  {
    name: 'Hackathon',
    location: 'Austin, TX',
    price: 15.00,
    starts_at: 45.days.from_now,
    description: %{
      Got an awesome app idea you've been itching to work on? Hunker
      down and hack away! This is an intense, focused day of hacking
      on anything you want. The entry fee goes toward a bounty of cash
      and prizes for winners in a variety of categories.
    }.squish,
    capacity: 33
  },
  {
    name: 'Kata Camp',
    location: 'Dallas, TX',
    price: 75.00,
    starts_at: 65.days.from_now,
    description: %{
      Kata Camp is where developers go to practice their craft without interruptions. Skip the status reports and stand-up meetings of a typical project. Just get 'er done! Price includes a buffet lunch and a leather-bound journal to record your kata achievements.
    }.squish,
    capacity: 50
  },
  {
    name: "Coffee 'n Code",
    location: 'Portland, OR',
    price: 0.00,
    starts_at: 20.days.ago,
    description: %{
      Start your day off right with a good cup of Joe while you sling some code with other local developers. By the time you hit the office, you'll be in the groove!
    }.squish,
    capacity: 10
  },
  {
    name: 'Rails User Group',
    location: 'Reston, VA',
    price: 0.00,
    starts_at: 2.days.ago,
    description: %{
      Come enjoy a technical talk and meet local Rails developers! This week's topic is a comparison of editors, templating systems, and whether to use tabs or spaces.
    }.squish,
    capacity: 200
  },
  {
    name: 'Ruby User Group',
    location: 'Chigaco, IL',
    price: 0.00,
    starts_at: 5.days.ago,
    description: %{
      Do you heart Ruby? So do we! Every week a local developer presents
      a new Ruby-related topic to help you keep on top of your game.
    }.squish,
    capacity: 250
  },
  {
    name: '5-Minute Lightning Talks',
    location: 'Kansas City, MO',
    price: 15.00,
    starts_at: 10.days.ago,
    description: %{
      Got a newfangled trick? A handy new tool? A just-released library? Here's your chance to share it! But you only get 5 minutes to present your must-know tip, so keep it snappy. Price includes an open ice cream and root beer float bar.
    }.squish,
    capacity: 20
  },
  {
    name: 'Drone Zone',
    location: 'Minneapolis, MN',
    price: 0.00,
    starts_at: 90.days.from_now,
    description: %{
      What happens when software and hardware geeks get together?
      Thing spin, whirl, and (possibly) collide! Everyone is welcome, whether you're new to hacking with drones and drone software, or have experience that reaches to the sky.
    }.squish,
    capacity: 75
  },
  {
    name: 'Coding Ninjas',
    location: 'San Diego, CA',
    price: 25.00,
    starts_at: 10.days.from_now,
    description: %{
      Why ninjas? We have no idea, but the icon is cool. Don't miss this opportunity to show off your ninja moves.
    }.squish,
    capacity: 25
  }
])

images = [
    ['BugSmash', "bugsmash.png"],
    ['Hackathon', "hackathon.png"],
    ['Kata Camp', "katacamp.png"],
    ["Coffee 'n Code", "coffee-code.png"],
    ['Rails User Group', "rails-user-group.png"],
    ['Ruby User Group', "ruby-user-group.png"],
    ['5-Minute Lightning Talks', "lightning.png"],
    ['Drone Zone', "drone-zone.png"],
    ['Coding Ninjas', "ninjas.png"]
]

images.each do |event_name, file_name|
  puts "#{event_name}: #{file_name}"
  f = File.open(Rails.root.join("app/assets/images/#{file_name}"))
  event = Event.find_by(name: event_name)
  event.main_image.attach(io: f, filename: file_name)
  # Need to add a delay as without this rails seems to be
  # running into concurrency problem
  sleep 1
end