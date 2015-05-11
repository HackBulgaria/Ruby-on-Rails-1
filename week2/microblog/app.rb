require 'sinatra'

get '/' do
  # - Display a view of all posts.
  # It would be nice to display something on the index page if there are no blog posts yet.
  'No new posts' || @posts
end 

get '/new' do
  # - Displays a view for creating a new post.
  # - Creates a new post.
  %{
    <form action="new" method="get">
      Title: <input type="text" name="post[title]"><br>
      Body: <input type="text" name="post[body]"><br>
      Author: <input type="text" name="post[author]"><br>
      <input type="submit" value="Submit">
    </form>
  }
end

get '/42' do 
  # - Displays a view of the post with id equal to 42.
  # We would like to see a suitable page if the requested blog post is not present.
  'No such post'
end

delete '/42' do 
  # - Deletes the post with id equal to 42.
end

# VALIDATION
# We would like to see a suitable page if the requested blog post is not present.
# It would be nice to display something on the index page if there are no blog posts yet.
# We would like our blog posts to not exceed the limit of 256 characters. 
# Make sure you check them before saving!

# Tags. 
# We want them too. Every sequence in a post that begins with # and continuous with a valid Ruby identifier
# is considered a tag. A post could have many tags. We want to be able to search for every post
# that is tagged in a particular way.

get '/search/ruby' do
  # is the interface that we will use for searching for posts tagged with #ruby. 
  # Present them in the same fashion you present the posts on the index page.
end
