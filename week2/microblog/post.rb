class Post
  def initialize(title, body, author)
    @title = title
    @body = body unless body.length > 256
    @author = author
  end
end