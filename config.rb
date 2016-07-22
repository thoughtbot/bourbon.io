require "lib/version"

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end
activate :directory_indexes
activate :dotenv
activate :syntax do |syntax|
  syntax.css_class = "syntax-highlight"
end

set :css_dir, "assets/stylesheets"
set :markdown_engine, :redcarpet
set :markdown,
  autolink: true,
  fenced_code_blocks: true,
  footnotes: true,
  highlight: true,
  smartypants: true,
  strikethrough: true,
  tables: true,
  with_toc_data: true

page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false

versions = Dir.glob("./data/*.json").map { |version| Version.new(version) }
latest_version = versions.max { |a, b| a.to_s <=> b.to_s }
set :latest_version, latest_version

versions.each do |version|
  proxy(
    "/docs/#{version}/index.html",
    "/docs/version/index.html",
    locals: {
      version: version,
      versions: versions,
    },
    ignore: true,
  )
end

proxy(
  "/docs/latest/index.html",
  "/docs/version/index.html",
  locals: {
    version: latest_version,
    versions: versions,
  },
  ignore: true,
)

proxy("_redirects", "redirects", ignore: true)

redirect "docs/index.html", to: "/docs/latest"

configure :development do
  activate :livereload do |reload|
    reload.no_swf = true
  end
end

configure :build do
  activate :asset_hash
  activate :gzip
  activate :minify_css
  activate :minify_html
end
