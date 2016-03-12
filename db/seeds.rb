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
    email: 'jtronlabs@gmail.com',
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
    title: "Public Speaking",
    body: "<p>This class is about fun stuff!</p>"
    )
EditablePage.create!(
    classification: "courses",
    title: "Class1",
    body: "<p>This class is about more fun stuff!</p>"
    )



Play.delete_all
if Rails.env == 'development' or Rails.env == 'test'
  plays=[]
  #seeding a profile picture
  play_one_profile_image = Rails.root.join("db/images/test1.jpeg").open
  play_two_profile_image = Rails.root.join("db/images/test_image.png").open
  play_three_profile_image = Rails.root.join("db/images/test2.png").open
  test_vid = "https://www.youtube.com/embed/C0DPdy98e4c"

  plays.push(
      Play.create!(title: "As You Like It",
              description: "a dope play fo sho",
              date_of_play: DateTime.new(3000,2,2),
              link_to_video: test_vid,
              profile_image: play_one_profile_image
          )
      )
  plays.push(
      Play.create!(title: "Romeo and Juliet",
              description: "a dope play fo sho",
              date_of_play: DateTime.new(2001,2,2),
              link_to_video: test_vid,
              profile_image: play_one_profile_image
          )
      )
  plays.push(
      Play.create!(title: "JB",
              description: "a dope play fo sho",
              date_of_play: DateTime.new(2003,2,2),
              link_to_video: test_vid,
              profile_image: play_three_profile_image
          )
      )
  plays.push(
      antigone = Play.create!(title: "Antigone",
              description: "a dope play fo sho",
              date_of_play: DateTime.new(2002,2,2),
              link_to_video: test_vid,
              profile_image: play_two_profile_image
          )
      )

  plays.push(
      Play.create!(title: "Romeo and Juliet",
              description: "a dope play fo sho",
              date_of_play: DateTime.new(2001,2,2),
              link_to_video: test_vid,
              profile_image: play_one_profile_image
          )
      )
  plays.push(
      Play.create!(title: "JB",
              description: "a dope play fo sho",
              date_of_play: DateTime.new(2003,2,2),
              link_to_video: test_vid,
              profile_image: play_three_profile_image
          )
      )
  plays.push(
      antigone = Play.create!(title: "Antigone",
              description: "a dope play fo sho",
              date_of_play: DateTime.new(2002,2,2),
              link_to_video: test_vid,
              profile_image: play_two_profile_image
          )
      )

  plays.push(
      Play.create!(title: "Romeo and Juliet",
              description: "a dope play fo sho",
              date_of_play: DateTime.new(2001,2,2),
              link_to_video: test_vid,
              profile_image: play_one_profile_image
          )
      )
  plays.push(
      Play.create!(title: "JB",
              description: "a dope play fo sho",
              date_of_play: DateTime.new(2003,2,2),
              link_to_video: test_vid,
              profile_image: play_three_profile_image
          )
      )
  plays.push(
      antigone = Play.create!(title: "Antigone",
              description: "a dope play fo sho",
              date_of_play: DateTime.new(2002,2,2),
              link_to_video: test_vid,
              profile_image: play_two_profile_image
          )
      )

  p1 = Rails.root.join("db/images/play_photos/1.jpg").open
  p2 = Rails.root.join("db/images/play_photos/2.jpg").open
  p3 = Rails.root.join("db/images/play_photos/3.jpg").open
  p4 = Rails.root.join("db/images/play_photos/4.jpg").open
  p5 = Rails.root.join("db/images/play_photos/5.jpg").open
  p6 = Rails.root.join("db/images/play_photos/6.jpg").open
  p7 = Rails.root.join("db/images/play_photos/7.jpg").open
  p8 = Rails.root.join("db/images/play_photos/8.jpg").open

  #seeding the 'pictures' field
  plays.each do |play|
    play.pictures = [p1,p2,p3,p4,p5,p6,p7,p8]
    play.save!
  end

end
