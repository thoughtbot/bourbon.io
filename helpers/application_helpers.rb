module ApplicationHelpers
  def code_demo(name)
    file_path = "#{root}/source/demos/_#{name}.slim"

    if File.exists?(file_path)
      partial "demos/#{name}"
    end
  end

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
    if content_for?(:title)
      [data.site.name, yield_content(:title)].join(" - ")
    else
      [data.site.name, data.site.tagline].join(" - ")
    end
  end

  def preferred_url
    path = yield_content :preferred_path
    URI.join(data.site.url, path)
  end

  def svg(name)
    root = Middleman::Application.root
    file_path = "#{root}/source/#{config[:images_dir]}/#{name}.svg"

    return File.read(file_path) if File.exists?(file_path)
    "(SVG not found)"
  end
end
