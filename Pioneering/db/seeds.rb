# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# seeding can avoid db inconsistencies between pairs

names = %w( jenny tim billy montana cynthia carlos maddie amin clarance peter )
titles = %w( Irish_whales Frank_Sinatra_at_the_club Billiards Darkness_of_mine jesus_meets_his_maker
            swimming_time_in_petersburg love_at_first_sight deer_in_the_grass soldier_without_a_mission
            far_beyond_the_horizon )

(8).upto(17) do |i|
    User.find(i).update(username: "#{names[i - 8]}")
end

11.times do |i|
    Artwork.create(
        title: "#{titles[i]}",
        image_url: "#{titles[i]}_url",
        artist_id: (i + 6)
    )
end