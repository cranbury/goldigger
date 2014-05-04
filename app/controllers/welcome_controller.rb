class WelcomeController < ApplicationController
  def index
  end

  def investors
    days = params[:days]

    @investors = []

    Investor.all.each do |investor|
      recent_investments = investor.investments.where(date > Date.today - days )
      @investors << investor if !recent_investments.empty?
    end

    render json: @investors
  end
end