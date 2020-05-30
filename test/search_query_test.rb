require "test_helper"
require "eshop/search_query"

class SearchQueryTest < Minitest::Test

  def test_defaults
    query = SearchQuery.new
    assert_equal("*", query.query, "Wrong default query")
    assert_equal(0, query.offset, "Wrong default query")
    assert_equal(24, query.limit, "Wrong default query")
    assert_empty(query.platforms, "Wrong default platforms")
    assert_nil(query.media_type, "Wrong default media types")
    assert_empty(query.genres, "Wrong default genres")
    assert_empty(query.languages, "Wrong default languages")
    assert_equal(false, query.on_sale, "Wrong default on sale")
    assert_equal(false, query.demo_available, "Wrong default on demo available")
    assert_equal(false, query.dlc_available, "Wrong default on dlc available")
  end

  def test_add_query
    query_to_add = "zelda"
    query = SearchQuery.new
    query.with_query query_to_add
    assert_equal("zelda", query.query, "SearchQuery should be #{query_to_add}")
  end

  def test_add_offset
    offset_to_add = 100
    query = SearchQuery.new
    query.with_offset offset_to_add
    assert_equal(100, query.offset, "Offset should be #{offset_to_add}")
  end

  def test_add_limit
    limit_to_add = 100
    query = SearchQuery.new
    query.with_limit limit_to_add
    assert_equal(100, query.limit, "Offset should be #{limit_to_add}")
  end

  def test_add_platform
    platform_to_add = :switch
    query = SearchQuery.new
    query.with_platform platform_to_add
    assert_includes(query.platforms, platform_to_add, "#{platform_to_add.to_s.capitalize} not added in platforms")
  end

  def test_set_media_type
    media_to_add = :retail
    query = SearchQuery.new
    query.with_media_type media_to_add
    assert_equal(media_to_add, query.media_type, "#{media_to_add.to_s.capitalize} should be media type")
  end

  def test_add_genre
    genre_to_add = :action
    query = SearchQuery.new
    query.with_genre genre_to_add
    assert_includes(query.genres, genre_to_add, "#{genre_to_add.to_s.capitalize} not added in genres")
  end

  def test_add_language
    language_to_add = :russian
    query = SearchQuery.new
    query.with_language language_to_add
    assert_includes(query.languages, language_to_add, "#{language_to_add.to_s.capitalize} not added in languages")
  end

  def test_set_on_sale
    query = SearchQuery.new
    query.with_on_sale
    assert_equal(true, query.on_sale, "On sale should be true")

    query.reset_on_sale
    assert_equal(false, query.on_sale, "On sale should be false")
  end

  def test_set_demo_available
    query = SearchQuery.new
    query.with_demo_available
    assert_equal(true, query.demo_available, "Demo available should be true")
    assert_equal(false, query.dlc_available, "DLC available should be false")
  end

  def test_set_dlc_available
    query = SearchQuery.new
    query.with_dlc_available
    assert_equal(true, query.dlc_available, "DLC available should be true")
    assert_equal(false, query.demo_available, "Demo available should be false")
  end

  def test_demo_and_dlc_exclude_each
    query = SearchQuery.new
    query.with_dlc_available
    query.with_demo_available
    assert_equal(true, query.demo_available, "Demo available should be true")
    assert_equal(false, query.dlc_available, "DLC available should be false")
    query.with_demo_available
    query.with_dlc_available
    assert_equal(true, query.dlc_available, "DLC available should be true")
    assert_equal(false, query.demo_available, "Demo available should be false")
  end

  def test_to_hash_defaults
    query = SearchQuery.new
    query_hash = query.to_hash
    assert_equal("*", query_hash[:q], "Wrong query")
    assert_equal("type:GAME", query_hash[:fq], "Wrong select query")
    assert_equal(0, query_hash[:start], "Wrong offset")
    assert_equal(24, query_hash[:rows], "Wrong limit")
  end
end
