require 'sinatra/base'
require_relative './../lib/chitter'

class ChitterManager < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = PeepList.all
    erb :'peeps_views/peeps'
  end

  post '/peeps' do
    PeepList.create(params[:text], params[:name], params[:created_date], params[:user_handle])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps_views/new_peep'
  end

  run! if app_file == $PROGRAM_NAME
end
