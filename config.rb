require "lib/version"

activate :aria_current
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end
activate :sprockets
activate :syntax do |syntax|
  syntax.css_class = "syntax-highlight"
end

set :css_dir, "assets/stylesheets"
set :images_dir, "assets/images"
set :js_dir, "assets/javascripts"
set :markdown_engine, :redcarpet
set :markdown,
  fenced_code_blocks: true,
  footnotes: true,
  highlight: true,
  no_intra_emphasis: true,
  smartypants: true,
  strikethrough: true,
  tables: true,
  with_toc_data: true

page "/*.json", layout: false
page "/*.txt", layout: false
page "/*.xml", layout: false
page "/docs/*", layout: "docs"

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

if defined? RailsAssets
  RailsAssets.load_paths.each do |path|
    sprockets.append_path path
  end
end

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
