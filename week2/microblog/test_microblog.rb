require 'minitest/autorun'

require_relative 'microblog'

class MicroblogTest < Minitest::Test
  def test_create_new_post
    post = Microblog.create_post('title', 'body', 'author')

    assert.equal post.id 1
  end
end