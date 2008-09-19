class MockupsController < ApplicationController
  def show
    render :template => "mockups/#{params[:name]}"
  end
end