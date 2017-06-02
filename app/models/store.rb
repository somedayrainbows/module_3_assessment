class Store
  attr_reader :name, :city, :distance, :phone, :type

  def initialize(raw_store={})
    @name = raw_store[:longName]
    @city = raw_store[:city]
    @distance = raw_store[:distance]
    @phone = raw_store[:phone]
    @type = raw_store[:storeType]
  end

end
