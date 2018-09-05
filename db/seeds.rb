# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "dsaenz", provider: "developer", uid: "dsaenz@test.com", avatar_url: "/assets/samples/user_avatar.jpg")

plank_metadata_group = MetadataGroup.create!(name: "Plank exercises")
plank_metadata_group.metadata_keys.create!(name: "Duration")

ExerciseType.create!([
  { name: "Lumbar spine movement" },
  { name: "The plank", metadata_group: plank_metadata_group },
  { name: "Side plank", metadata_group: plank_metadata_group }
])

planned_workout = PlannedWorkout.create!(name: "The pain-free cyclist core exercises")
ExerciseType.all.each_with_index do |exercise_type, index|
  planned_workout.planned_exercises.create!(exercise_type: exercise_type, order: index, sets: 3)
end

workout = Workout.from(planned_workout)
_exercise1, exercise2, exercise3 = workout.exercises
exercise2.metadatums.first.assign_attributes(value: "90")
exercise3.metadatums.first.assign_attributes(value: "120")
workout.save!
