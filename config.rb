# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :directory_indexes
set :relative_links, true
activate :livereload

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :build do
  activate :minify_css
  activate :minify_javascript
end

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

helpers do
  def af_category(title, &block)
    partial 'partials/af_category', locals: { title: title } do
      capture_html(&block)
    end
  end

  def af_link(params, &block)
    partial 'partials/af_link', locals: { title: params[:title], link: params[:link], image: params[:image] } do
      capture_html(&block)
    end
  end

  #####AF LINK EXAMPLE #####
  #<% af_link({title: "Link Text", link: "www.testlink.com", image: "images/af/equipment/butts.png"} ) do %>
  #  Here's some description text for an affiliate item.
  #<% end %>
end

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

activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = 'bubble-tea-today' # The name of the S3 bucket you are targeting. This is globally unique.
  s3_sync.region                     = 'us-east-1'     # The AWS region for your bucket.
  s3_sync.aws_access_key_id          = ENV['S3_ACCESS_KEY']
  s3_sync.aws_secret_access_key      = ENV['S3_SECRET_ACCESS_KEY']
  s3_sync.delete                     = false # We delete stray files by default.
  s3_sync.after_build                = false # We do not chain after the build step by default.
  s3_sync.prefer_gzip                = true
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
  s3_sync.prefix                     = ''
  s3_sync.version_bucket             = false
  s3_sync.index_document             = 'index.html'
  s3_sync.error_document             = '404.html'
end
 
 activate :dotenv