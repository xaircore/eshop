module Eshop

  class Client

    attr_reader :country

    def initialize(country)
      @country = country
    end

    def select(query)
      []
    end

    def sales
      []
    end
  end
end
