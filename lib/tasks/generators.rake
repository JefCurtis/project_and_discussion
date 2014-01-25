namespace :generators do
  
  desc "Generate random projects and discussions for testing"
  task :project_and_discussions => :environment do
    number_of_projects = ENV['number_of_projects'] ? ENV['number_of_projects'].to_i : 50
    number_of_discussions = ENV['number_of_discussions'] ? ENV['number_of_discussions'].to_i : 10

    number_of_projects.times do
      project = Project.create(title: Faker::Lorem.sentence(10), body: Faker::Lorem.paragraph(5))
      number_of_discussions.times do
        project.discussions.create(title: Faker::Lorem.sentence(10), description: Faker::Lorem.paragraph(5))
      end
    end
  end
end
