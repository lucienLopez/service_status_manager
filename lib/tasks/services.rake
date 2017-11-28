namespace :services do
  desc 'update_statuses of all services. Should be run often to keep data fresh'
  task :update_statuses => :environment do
    Service.find_each { |service| service.update_status }
  end
end