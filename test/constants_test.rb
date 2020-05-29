require "test_helper"
require "eshop"

class ConstantsTest < Minitest::Test
  def test_countries
    assert_equal(2, Eshop::COUNTRIES.length, "Wrong number of countries")
    assert_includes(Eshop::COUNTRIES, :russia, "Russia should be in the countries")
    assert_includes(Eshop::COUNTRIES, :uk, "UK should be in the countries")
  end

  def test_platforms
    assert_equal(1, Eshop::PLATFORMS.length, "Wrong number of platforms")
    assert_includes(Eshop::PLATFORMS, :switch, "Switch should be in the platforms")
  end

  def test_media_types
    assert_equal(2, Eshop::MEDIA_TYPES.length, "Wrong number of media types")
    assert_includes(Eshop::MEDIA_TYPES, :retail, "Retail should be in the media types")
    assert_includes(Eshop::MEDIA_TYPES, :download, "Download should be in the media types")
  end

  def test_genres
    assert_equal(14, Eshop::GENRES.length, "Wrong number of media genres")
    assert_includes(Eshop::GENRES, :action, "Action should be in the genres")
    assert_includes(Eshop::GENRES, :adventure, "Adventure should be in the genres")
    assert_includes(Eshop::GENRES, :arcade, "Arcade should be in the genres")
    assert_includes(Eshop::GENRES, :fighting, "Fighting should be in the genres")
    assert_includes(Eshop::GENRES, :health_fitness, "Health and fitness should be in the genres")
    assert_includes(Eshop::GENRES, :music, "Music should be in the genres")
    assert_includes(Eshop::GENRES, :party, "Party should be in the genres")
    assert_includes(Eshop::GENRES, :platformer, "Platformer should be in the genres")
    assert_includes(Eshop::GENRES, :puzzle, "Puzzle should be in the genres")
    assert_includes(Eshop::GENRES, :racing, "Racing should be in the genres")
    assert_includes(Eshop::GENRES, :rpg, "RPG should be in the genres")
    assert_includes(Eshop::GENRES, :shooter, "Shooter should be in the genres")
    assert_includes(Eshop::GENRES, :simulation, "Simulation should be in the genres")
    assert_includes(Eshop::GENRES, :sports, "Sports should be in the genres")
  end

  def test_languages
    assert_equal(9, Eshop::LANGUAGES.length, "Wrong number of media languages")
    assert_includes(Eshop::LANGUAGES, :english, "English should be in the languages")
    assert_includes(Eshop::LANGUAGES, :german, "German should be in the languages")
    assert_includes(Eshop::LANGUAGES, :french, "French should be in the languages")
    assert_includes(Eshop::LANGUAGES, :spanish, "Spanish should be in the genres")
    assert_includes(Eshop::LANGUAGES, :italian, "Italian  should be in the languages")
    assert_includes(Eshop::LANGUAGES, :dutch, "Dutch should be in the languages")
    assert_includes(Eshop::LANGUAGES, :portuguese, "Portuguese should be in the languages")
    assert_includes(Eshop::LANGUAGES, :russian, "Russian should be in the languages")
    assert_includes(Eshop::LANGUAGES, :japanese, "Japanese should be in the languages")
  end
end
