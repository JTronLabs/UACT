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
        password: 'password',
        password_confirmation: 'password')
    )
users.push(
    User.create!(email: 'a@a.a',
        password: 'password',
        password_confirmation: 'password')
    )


Play.delete_all
test_play = Play.create!(title: "Romeo and Juliet",
        description: "a dope play fo sho",
        date_of_play: DateTime.new(2001,2,2)
    )
#seeding a profile picture
test_play.profile_image = Rails.root.join("db/images/test_image.png").open
test_play.save!

#seeding play pictures - not working

#test_play.pictures.push(
#    Rails.root.join("db/images/test1.jpeg").open    )
#test_play.pictures.push(       
#    Rails.root.join("db/images/test2.png").open    )
#test_play.save!