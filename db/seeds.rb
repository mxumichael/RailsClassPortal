# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(
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
