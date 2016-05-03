# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new(username: 'admin', email: 'admin@gmail.com', password: 'insecure')
admin.skip_confirmation!
admin.save
admin.roles = ['admin', 'user']
admin.save!