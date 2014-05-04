class Investor < ActiveRecord::Base
  has_many :investments


  def pull_all_people
    response = HTTParty.get("http://api.crunchbase.com/v/2/people?user_key=f37ccc5c5ba5deb17395cecee16778cd")
    @people = reponse["data"]["items"]
  end


end