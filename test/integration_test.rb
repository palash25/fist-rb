require "minitest/autorun"

require "fist/client"

class IntegrationTest < Minitest::Test
  def setup
    @client = Fist::FistClient.new("localhost", "5575")
    @client.connect
  end

  def test_version
    assert_equal @client.version, 9
  end

  def test_index
    assert_equal @client.index("doc", "some text"), 21
  end

  def test_search
    assert_equal @client.search("text"), 13
  end

  def test_delete
    assert_equal @client.delete("text"), 13
  end

  def test_close
    assert_equal @client.close, 6
  end
end
