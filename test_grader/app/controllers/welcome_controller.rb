class WelcomeController < ApplicationController


  def welcome
   
  end

  def home
    @user = current_user

  end


end