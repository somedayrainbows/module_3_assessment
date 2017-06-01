class SearchService
  attr_reader :zipcode

  def initialize(params)
    @zipcode = params[:zipcode]
    @_conn = Faraday.new("https://api.bestbuy.com/")
  end

  def find_stores
    response = conn.get("v1/stores(area(#{zipcode},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=10&apiKey=#{ENV['BB_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    @_conn
  end

end
