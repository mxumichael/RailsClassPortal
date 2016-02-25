# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@Admin = SuperUser.create!(
    name: 'Super User',
    email: 'admin@admin.com',
    password: 'password',
    password_confirmation: 'password'
)

Student.create!(
        name: 'Student User',
        email: 'student@ncsu.edu',
        password: 'password',
        password_confirmation: 'password'
)

@instructor = Instructor.create!(
        name: 'Instructor User',
        email: 'instructor@ncsu.edu',
        password: 'password',
        password_confirmation: 'password'
)

(100..115).each do |i|
  course = Course.create!(
            course_number: i,
            title: 'Course ' + i.to_s,
            start_date: Date.parse((i-99).to_s + '-01-2016'),
            end_date: Date.parse((i-99).to_s + '-05-2016'),
            status: 'Active',
  )

  Enrollment.create!(
                user_id: @instructor.id,
                course_id: course.id,
                approve: true,
                deny: false
  )
end

10.times do
  Student.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'password',
      password_confirmation: 'password'
  )
end
10.times do
  Instructor.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'password',
      password_confirmation: 'password'
  )
end
(4..16).each do |i|
  Enrollment.create!(
      user_id: i,
      course_id: i,
      approve: true,
      deny: false,
      grade: 70+2*i
  )
end