# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Form.create(
	:project => "The next biggest thing",
	:first_hackathon => true,
	:why => "Hackthons are the future!",
	:user_id => 5432,
	:code_of_conduct_read => true)