class Search

  # def initialize(raw_results={})
  #   @total_stores = raw_results[:total]
  #   @stores = raw_results[:stores]
  # end

  def self.find_stores(zipcode)
    SearchService.new({zipcode: zipcode})
  end

  def total_stores

  end

  def individual_stores
    @stores.map do |store|
      binding.pry
    end
  end


end
