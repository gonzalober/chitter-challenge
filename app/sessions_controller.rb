class SessionsController < ApplicationController
  
  attr_reader :email_1

  get '/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    p params[:email]
    p'-----'
    @email_1 = params[:email]
    p @email_1
    redirect '/posts'
  end

  get '/logout' do
    session.clear
  end

end