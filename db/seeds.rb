# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create a samle user
User.create(:email => "foo@bar.com")

# Set up a category
Category.create(:name => "Food", :queue => nil)
Category.create(:name => "Tech Companies", :queue => nil)

# Set up a quiz
Quiz.create(:user_id => 1, :name => "Test Quiz")

# Populate our quiz with both categories
QuizCategory.create(:quiz_id => 1, :category_id => 1)
QuizCategory.create(:quiz_id => 1, :category_id => 2)

# Create a couple of cards for each category
Card.create(  :category_id => 1, 
              :title => "Types of Cereal", 
              :body => "## Brands\n\n* Kellogs\n* Post\n\n## Cereals\n\n* Captain Crunch\n* Frosted Flakes\n* Honey Combs"
            )
Card.create(  :category_id => 1, 
              :title =>"Indian Food Dishes",
              :body => "## North Indian\n\n* Chicken Tikka Masala\n* Naan\n"
            )
Card.create(  :category_id => 1,
              :title => "Apple Types",
              :body => "## Red Apples\n\n1. Red Delicious\n1. Fuji\n\n## Green Apples\n\n* Granny Smith\n* *Green Giant*"
            )
Card.create(  :category_id => 2,
              :title => "Apple",
              :body => "Big ass tech company that makes the **iPhone** and all the other great hits"
            )
Card.create(  :category_id => 2,
              :title => "Microsoft",
              :body => "Like the Empire in Star Wars"
            )
Card.create(  :category_id => 2,
              :title => "Google",
              :body => "Like the Emper-OR in Star Wars... very powerful and purportedly good but possibly a Sith"
            )
Card.create(  :category_id => 2,
              :title => "Nullsoft",
              :body => "Remember Winamp?????????"
            )

