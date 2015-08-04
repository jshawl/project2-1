# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Manager.destroy_all
User.destroy_all

gc = Manager.create(username: "gc")
post = gc.posts.create(title: "Dishwasher", description: "Bring order to chaos")
gc.posts.create(title: "Bartender", description: "Tend the bar")
gc.posts.create(title: "Server", description: "Convincingly smile at people you don't care for")

jsm = User.create(username: "jsm")
jsm.bids.create(post: post, info: "I can do that")
