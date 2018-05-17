require 'sinatra'
require 'googlebooks'

get ('/') do
  erb(:index) #renders the forms
end

post('/search_book') do
 book_title = params[:title]#accepts input in index.erb
 redirect "/search?book_title=#{book_title}" # redirects with a query to search.erb
end

get ('/search') do
   @search_title = params[:book_title]
   books = GoogleBooks.search(@search_title)
   first_book = books.first
   @author = first_book.authors
   @isbn = first_book.isbn
   @image = first_book.image_link(:zoom => 2)
   erb(:search)
end
