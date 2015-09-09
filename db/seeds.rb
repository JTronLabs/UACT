# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
person_img =  Rails.root.join("db/images/person.jpg").open

User.create!( #not included in users array
    role:"admin",
    email: 'gvarner@uaschools.org',
    first_name:'Greg',
    last_name:'Varner',
    password: 'password',
    password_confirmation: 'password')
User.create!( #not included in users array
    role:"admin",
    email: 'random.emails.226@gmail.com',
    first_name:'James',
    last_name:'Lowrey',
    password: 'password',
    password_confirmation: 'password')

EditablePage.delete_all
EditablePage.create!(
    classification: "homepage_left",
    body: "<h3>Director</h3>"    
    )
EditablePage.create!(
    classification: "homepage_mid",
    body: "<h1>UACT</h1>"    
    )
EditablePage.create!(
    classification: "homepage_right",
    body: "<p>Make links to ticket purchase and UACT donation here</p>"    
    )
EditablePage.create!(
    classification: "courses",
    title: "<h3 style=\"color:red\">Public Speaking</h3>",
    body: "<p>This class is about fun stuff!</p>"
    )
EditablePage.create!(
    classification: "courses",
    title: "<h3 style=\"color:red\">Class1</h3>",
    body: "<p>This class is about more fun stuff!</p>"
    )

Play.delete_all
plays=[]
#seeding a profile picture
play_one_profile_image = Rails.root.join("db/images/test1.jpeg").open
play_two_profile_image = Rails.root.join("db/images/test_image.png").open
play_three_profile_image = Rails.root.join("db/images/test2.png").open

plays.push(
    Play.create!(title: "As You Like It",
            description: "a dope play fo sho",
            date_of_play: DateTime.new(3000,2,2),
            profile_image: play_one_profile_image
        )
    )
plays.push(
    Play.create!(title: "Romeo and Juliet",
            description: "a dope play fo sho",
            date_of_play: DateTime.new(2001,2,2),
            profile_image: play_one_profile_image
        )
    )
plays.push(
    Play.create!(title: "JB",
            description: "a dope play fo sho",
            date_of_play: DateTime.new(2003,2,2),
            profile_image: play_three_profile_image
        )
    )
plays.push(
    antigone = Play.create!(title: "Antigone",
            description: "a dope play fo sho",
            date_of_play: DateTime.new(2002,2,2),
            profile_image: play_two_profile_image
        )
    )

#seeding play pictures - not working
#antigone.pictures.push(Rails.root.join("db/images/play_photos/1.jpg").open )
#antigone.save!














