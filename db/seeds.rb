Investor.destroy_all
Investment.destroy_all

#david = HTTParty.get("http://api.crunchbase.com/v/2/person/david-tisch?user_key=f37ccc5c5ba5deb17395cecee16778cd")
page_suffix = ""
@people = []
pages = 1
page = 0

while page < pages do
  page += 1
  page_suffix = "&page=" + page.to_s if page > 1

  people = HTTParty.get("http://api.crunchbase.com/v/2/people?user_key=f37ccc5c5ba5deb17395cecee16778cd" + page_suffix)
  @people += people["data"]["items"]

  pages = people["data"]["paging"]["number_of_pages"]

end
# people_one = HTTParty.get("http://api.crunchbase.com/v/2/people?user_key=f37ccc5c5ba5deb17395cecee16778cd&page=2")
# @people_one = people_one["data"]["items"]

all_paths = @people.map {|person| person["path"]}

investors = {}

all_paths.each_with_index do |path, i|
  person = @people[i]
  # path = person["path"]
  person_response = HTTParty.get("http://api.crunchbase.com/v/2/"+ path +"?user_key=f37ccc5c5ba5deb17395cecee16778cd")

 
  if person_response["data"]["relationships"]["investments"]
    investor = Investor.create({name: person["name"], path: person["path"]})
    
    #binding.pry

    person_response["data"]["relationships"]["investments"]["items"].each do |investment|
      fund_path = investment["funding_round"]["path"]
      invest_response = HTTParty.get("http://api.crunchbase.com/v/2/"+ fund_path +"?user_key=f37ccc5c5ba5deb17395cecee16778cd")
      type = invest_response["data"]["properties"]["funding_type"]
      date = invest_response["data"]["properties"]["announced_on"]
      Investment.create({investor_id: investor.id, round: type, date: date})
    end
    #investors[person] = [person_response["data"]["relationships"]["investments"]] 
  end

end
