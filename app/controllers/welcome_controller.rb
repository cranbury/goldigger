class WelcomeController < ApplicationController
  def index
  end

  def investors
    days = params[:days].to_i

    @investors = []

    Investor.all.each do |investor|
      #binding.pry
      recent_investments = investor.investments.select{|inv| inv.date > Date.today - days }
      @investors << investor if !recent_investments.empty?
    end

    render json: @investors
  end
end