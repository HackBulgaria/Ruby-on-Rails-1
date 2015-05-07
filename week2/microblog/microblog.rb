require_relative 'post.rb'

class Microblog
  attr_reader :id
  class << self
    def initialize
      @posts = {}
    end

    def all_posts
      @posts
    end

    def display_post(id)
      @posts[id]
    end

    def delete_post(id)
      @posts.delete(id) { |element| "#{element} not found" }
    end

    def create_post(title, body, author)
      @id = @posts.keys.last || -1
      @posts[id + 1] = Post.new(title, body, author)
    end

    def id
      @id
    end
end