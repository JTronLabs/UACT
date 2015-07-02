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
plays=[]
plays.push( 
    Play.create!(title: "Romeo and Juliet",
        description: "a dope play fo sho",
        date_of_play: DateTime.new(2001,2,2),
        created_at: DateTime.new(2001,2,2),
        updated_at: DateTime.new(2001,2,2)
    )
    )
