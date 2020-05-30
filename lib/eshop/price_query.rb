class PriceQuery

  attr_reader :country, :language, :ids

  def initialize
    @country = nil
    @language = nil
    @ids = []
  end

  def with_country(country)
    @country = country
    self
  end

  def with_language(language)
    @language = language
    self
  end

  def with_id(id)
    @ids.push id
    self
  end

  def to_hash
    {
        :country => @country,
        :lang => @language,
        :ids => @ids.join(",")
    }
  end
end
