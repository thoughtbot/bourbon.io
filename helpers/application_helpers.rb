module ApplicationHelpers
  # def icon(name)
  #   root = Middleman::Application.root
  #   file_path = "#{root}/source/images/icons/#{name}.svg"
  #   return File.read(file_path) if File.exists?(file_path)
  #   "(not found)"
  # end

  def markdown(contents)
    renderer = Redcarpet::Render::HTML
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    markdown.render(contents)
  end

  # def svg(name)
  #   root = Middleman::Application.root
  #   file_path = "#{root}/source/images/#{name}.svg"
  #   return File.read(file_path) if File.exists?(file_path)
  #   "(not found)"
  # end
end
