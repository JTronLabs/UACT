# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
users = []
users.push( 
    User.create!(email: 'gvarner@uaschools.org',
        first_name:'Greg',
        last_name:'Varner',
        graduation_year:0,
        approved:true,
        password: 'password',
        password_confirmation: 'password')
    )
users.push(
    User.create!(email: 'a@a.a',
        first_name:'a',
        last_name:'aa',
        graduation_year:3000,
        password: 'password',
        password_confirmation: 'password')
    )


Play.delete_all
#seeding a profile picture
play_one_profile_image = Rails.root.join("db/images/test1.jpeg").open
play_two_profile_image = Rails.root.join("db/images/test_image.png").open
play_three_profile_image = Rails.root.join("db/images/test2.png").open

Play.create!(title: "Romeo and Juliet",
        description: "a dope play fo sho",
        date_of_play: DateTime.new(2001,2,2),
        profile_image: play_one_profile_image
    )
Play.create!(title: "JB",
        description: "a dope play fo sho",
        date_of_play: DateTime.new(2003,2,2),
        profile_image: play_three_profile_image
    )
Play.create!(title: "Antigone",
        description: "a dope play fo sho",
        date_of_play: DateTime.new(2002,2,2),
        profile_image: play_two_profile_image
    )

#seeding play pictures - not working

#test_play.pictures.push(
#    Rails.root.join("db/images/test1.jpeg").open    )
#test_play.pictures.push(       
#    Rails.root.join("db/images/test2.png").open    )
#test_play.save!