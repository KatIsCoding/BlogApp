# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# User.destroy_all
# Post.destroy_all
# Comment.destroy_all
 first_user = User.new(:name => 'Tom', :photo => 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1', :bio => 'Teacher from Mexico.',:email => 'firstUser@example.com', :password => 'password', :password_confirmation => 'password')
 second_user = User.new(:name => 'Lilly', :photo => 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1', :bio => 'Teacher from Mexico.',:email => 'secondUser@example.com', :password => 'passtest231564', :password_confirmation => 'passtest231564', :role => 'admin')
 first_user.skip_confirmation!
 second_user.skip_confirmation!
 first_user.save
 second_user.save

 first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post', commentscounter: 0, likescounter: 0)
 second_post = Post.create(author: first_user, title: 'Hello', text: 'This is my second post', commentscounter: 0, likescounter: 0)
 third_post = Post.create(author: second_user, title: 'Hey!', text: 'This is my first post', commentscounter: 0, likescounter: 0)

 Like.create(author: first_user, post: first_post)
 Like.create(author: second_user, post: first_post)

 Comment.create(author: first_user, post: first_post, text: 'This is my first comment')