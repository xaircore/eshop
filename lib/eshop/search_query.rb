class SearchQuery

  ON_SALE_SORTING = "price_discount_percentage_f desc, price_lowest_f desc".freeze
  OFF_SALE_SORTING = "deprioritise_b asc, popularity asc".freeze
  FULL_QUERY = "*".freeze
  AND_SEPARATOR = " AND ".freeze
  GAME_TYPE = "type:GAME".freeze
  ON_SALE = '(price_has_discount_b:\"true\")'.freeze
  DEMO_AVAILABLE = '(demo_availability:\"true\")'.freeze
  DLC_AVAILABLE = '(add_on_content_b:\"true\")'.freeze
  DIGITAL_VERSION = '(digital_version_b:\"true\")'.freeze
  RETAIL_VERSION = '(physical_version_b:\"true\")'.freeze

  private_constant :OFF_SALE_SORTING
  private_constant :OFF_SALE_SORTING
  private_constant :FULL_QUERY
  private_constant :AND_SEPARATOR
  private_constant :GAME_TYPE
  private_constant :DIGITAL_VERSION
  private_constant :DEMO_AVAILABLE
  private_constant :DLC_AVAILABLE

  attr_reader :query, :offset, :limit, :platforms, :media_types, :genres, :languages, :on_sale, :demo_available, :dlc_available

  def initialize
    @query = ""
    @offset = 0
    @limit = 24
    @platforms = []
    @media_types = []
    @genres = []
    @languages = []
    @on_sale = false
    @demo_available = false
    @dlc_available = false
  end

  def add_query(query)
    @query = query
  end

  def add_offset(offset)
    @offset = offset
    self
  end

  def add_limit(limit)
    @limit = limit
    self
  end

  def add_platform(platform)
    @platforms.push platform
    self
  end

  def add_media_type(media_type)
    @media_types.push media_type
    self
  end

  def add_genre(genre)
    @genres.push genre
    self
  end

  def add_language(language)
    @languages.push language
    self
  end

  def add_on_sale
    @on_sale = true
    self
  end

  def add_demo_available
    @demo_available = true
    @dlc_available = false
    self
  end

  def add_dlc_available
    @dlc_available = true
    @demo_available = false
    self
  end

  def to_hash
    {
        :q => @query.empty? ? FULL_QUERY : @query,
        :fq => (get_fetch_query.join AND_SEPARATOR),
        :start => @offset,
        :rows => @limit,
        :sort => @on_sale ? ON_SALE_SORTING : OFF_SALE_SORTING
    }
  end

  private

  def get_fetch_query
    select = []
    select.push GAME_TYPE
    select.push ON_SALE if @on_sale
    select.push DEMO_AVAILABLE if @demo_available
    select.push DLC_AVAILABLE if @dlc_available
    select.push get_platform_query unless @platforms.empty?
    select.push get_genres_query unless @genres.empty?
    select.push get_language_query unless @languages.empty?
    select
  end

  def get_platform_query
    ""
  end

  def get_genres_query
    ""
  end

  def get_language_query
    ""
  end

  def get_media_types_query
    ""
  end
end
