module ApplicationHelpers
  def github_file_url(file_path, version)
    "https://github.com/thoughtbot/bourbon/blob/v#{version}/core/#{file_path}"
  end

  def markdown(contents)
    renderer = Redcarpet::Render::HTML
    markdown = Redcarpet::Markdown.new(
      renderer,
      fenced_code_blocks: true,
      footnotes: true,
      highlight: true,
      no_intra_emphasis: true,
      smartypants: true,
      strikethrough: true,
      tables: true,
      with_toc_data: true
    )
    markdown.render(contents)
  end

  def page_description
    yield_content(:description) || data.site.description
  end

  def page_title
    title = "Bourbon - "

    if content_for?(:title)
      title << yield_content(:title)
    else
      title << data.site.title
    end
  end

  def preferred_url
    path = yield_content :preferred_path
    File.join(ENV["SITE_URL"], path, "/")
  end

  def svg(name)
    root = Middleman::Application.root
    foo = config.images_dir
    file_path = "#{root}/source/#{foo}/#{name}.svg"

    return File.read(file_path) if File.exists?(file_path)
    "(not found)"
  end
end
