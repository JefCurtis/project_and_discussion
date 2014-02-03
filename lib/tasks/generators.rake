namespace :generators do
  
  desc "Generate random projects and discussions for testing"
  task :project_and_discussions => :environment do
    number_of_projects = ENV['number_of_projects'] ? ENV['number_of_projects'].to_i : 10
    number_of_discussions = ENV['number_of_discussions'] ? ENV['number_of_discussions'].to_i : 5

    number_of_projects.times do
      project = Project.create(title: Faker::Lorem.sentence(3), body: Faker::Lorem.paragraph(4))
      number_of_discussions.times do
        project.discussions.create(description: Faker::Lorem.paragraph(2))
      end
    end
  end
end
