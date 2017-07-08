# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :directory_indexes
activate :livereload

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end

# flavor of the week blog
activate :blog do |blog| 
  blog.name = "flavors_of_the_week" 
  blog.prefix = "flavors-of-the-week" 
  blog.layout = "flavors-of-the-week"
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end 

# page "/flavors-of-the_week/*", :layout => "flavors-of-the-week"

# featured shops blog
activate :blog do |blog| 
  blog.name = "featured_shops" 
  blog.prefix = "featured-shops"
  blog.paginate = true 
  blog.per_page = 10
  blog.page_link = "page/{num}"
end 

page "/featured-shops/*", :layout => "featured-shops"