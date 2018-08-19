# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "dsaenz", provider: "developer", uid: "dsaenz@test.com", avatar_url: "/assets/samples/user_avatar.jpg")

ExerciseType.create!([{ name: "Lumbar spine movement" }, { name: "The plank" }])

workout = Workout.create!(name: "The pain-free cyclist core exercises")

ExerciseType.all.each_with_index do |exercise_type, index|
  workout.exercises.create!(exercise_type: exercise_type, order: index, sets: 3)
end
