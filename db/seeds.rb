# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# this might be good to run first as it clears the id's to 0,1,2
# DrawingType.delete_all
drawing_types = DrawingType.create([{ type_description:'Head'}, { type_description:'Torso'}, { type_description:'Legs' } ])