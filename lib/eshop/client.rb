module Eshop
  class Client
    attr_reader :country

    def initialize(country)
      @country = country
    end
  end
end
