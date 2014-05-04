class WelcomeController < ApplicationController
  def index
  end

  def investors
    days = params[:days].to_i
    round = params[:round].downcase

    @investors = []

    Investor.all.each do |investor|
      #binding.pry
      recent_investments = investor.investments.select{|inv| inv.date > Date.today - days }
      recent_investments = recent_investments.select{|inv| inv.round == round} if round != "all"
      @investors << investor if !recent_investments.empty?
    end

    render json: @investors
  end
end