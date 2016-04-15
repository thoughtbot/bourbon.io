class Version
  attr_reader :doc_items, :version

  def initialize(filename)
    file = File.read(filename)
    @doc_items = JSON.parse(file, object_class: OpenStruct).
      reject { |doc_item| doc_item["access"] == "private" }

    @version = filename
  end

  def to_s
    /\d_\d_\d/.match(version).to_s.gsub("_", ".")
  end
end
