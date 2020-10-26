require_relative './app/chitter_app'
require_relative './app/sessions_controller'
require_relative './app/posts_controller'
require_relative './app/users_controller'
require_relative './app/application_controller'

run ChitterManager
use SessionsController
use PostsController
use UsersController
run ApplicationController
