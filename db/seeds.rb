# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(
    name: 'Super User',
    email: 'admin@admin.com',
    is_student: false,
    is_admin: true,
    is_instructor: false,
    password: 'password',
    password_confirmation: 'password'
)

User.create!(
        name: 'Student User',
        email: 'student@ncsu.edu',
        is_student: true,
        is_admin: false,
        is_instructor: false,
        password: 'password',
        password_confirmation: 'password'
)

User.create!(
        name: 'Instructor User',
        email: 'instructor@ncsu.edu',
        is_student: false,
        is_admin: false,
        is_instructor: true,
        password: 'password',
        password_confirmation: 'password'
)

(100..115).each do |i|
  Course.create!(
            course_number: i,
            title: 'Course ' + i.to_s,
            start_date: Date.parse((i-99).to_s + '-01-2016'),
            end_date: Date.parse((i-99).to_s + '-05-2016'),
            status: 'Active'
  )
end

10.times do
  User.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          is_student: true,
          is_instructor: false,
          is_admin: false,
          password: 'password',
          password_confirmation: 'password'
  )
end
(1..12).each do |i|
  Enrollment.create!(
      user_id: i,
      course_id: i,
      approve: true,
      deny: false,
      grade: 70+2*i
  )
end