require 'pry'
require_relative 'sessions_controller'

class PostsController < ApplicationController

  get '/posts' do
    p @email_1
    "You are logged in as #{@email_1}"
  end

  get '/posts/new' do
    if !logged_in?
      redirect '/login'
    else
      "A new post form"
    end
  end

  get '/posts/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      "An edit post form"
    end
  end
end