require './config/environment'

configure :development do
end

if ActiveRecord::Migrator.needs_migration?
raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use ItemController
use UserController
run ApplicationController
