class TestsController < ApplicationController

  def index
    @user = current_user
    @tests = @user.try(:tests)
  end

  def new
    @test = Test.new

    @format = Test.format
    @format.each do |key,value|
     @test.sections.build(title: key.to_s).answers.build
    end
  end

  def create
    binding.pry

  end

  def show

  end



end