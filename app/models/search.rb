class Search
  # attr_reader :total_stores, :stores
  #
  # def initialize
  #   @total_stores = raw_results[:total]
  #   @stores = raw_results[:stores]
  # end

  def self.get_stores(zipcode)
    service = SearchService.new({zipcode: zipcode})
    raw_results = service.find_stores
    binding.pry
  end

end
