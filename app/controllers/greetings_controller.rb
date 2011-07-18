class GreetingsController < ApplicationController
  def new
    render :text => "Welcome #{current_user.nickname}, your UUID is #{current_user.uuid}"
  end
end