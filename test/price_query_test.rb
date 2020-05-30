require "test_helper"
require "eshop/price_query"

class PriceQueryTest < Minitest::Test

  def test_defaults
    query = PriceQuery.new
    assert_nil(query.country, "Wrong default query")
    assert_nil(query.language, "Wrong default query")
    assert_empty(query.ids, "Wrong default platforms")
  end

  def test_set_country
    country_to_set = :russia
    query = PriceQuery.new
    query.with_country country_to_set
    assert_equal(country_to_set, query.country, "Country should be #{country_to_set.to_s.capitalize}")
  end

  def test_set_language
    lang_to_set = :ru
    query = PriceQuery.new
    query.with_language lang_to_set
    assert_equal(lang_to_set, query.language, "Language should be #{lang_to_set.to_s.capitalize}")
  end

  def test_with_id
    id_to_add = 443556
    query = PriceQuery.new
    query.with_id id_to_add
    assert_equal(1, query.ids.length, "IDs length should be 1")
    assert_includes(query.ids, id_to_add, "#{id_to_add} should be in IDs")
  end

  def test_to_hash_defaults
    query = PriceQuery.new
    query_hash = query.to_hash
    assert_nil(query_hash[:country], "Wrong country")
    assert_nil(query_hash[:lang], "Wrong lang")
    assert_equal("", query_hash[:ids], "IDs should be empty")
  end
end
