class Search
  attr_reader :zipcode

  def initialize(zipcode)
    @zipcode = zipcode.to_i
  end

  def get_stores
    service = SearchService.new(zipcode)
    raw_results = service.find_stores
    stores = raw_results[:stores].map do |store|
      Store.new(store)
    end
  end

  def total_stores
    service = SearchService.new(zipcode)
    raw_results = service.find_stores[:total]
  end

end
