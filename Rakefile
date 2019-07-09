desc "Generate documentation for a published version of Bourbon"
task :generate_docs_for do
  ARGV.each { |a| task a.to_sym do ; end }
  version = ARGV[1]
  version_slug = version.gsub(/\./, "_")

  fail "\nPlease provide version number\n\n" unless version

  workspace = "tmp/bourbon"
  system("mkdir -p #{workspace}")

  puts "Downloading Bourbon v#{version}"
  archive = "#{workspace}/bourbon.tar.gz"
  archive_contents = "#{workspace}/bourbon_#{version_slug}"
  system("curl -L https://api.github.com/repos/thoughtbot/bourbon/tarball/v#{version} > #{archive}")
  system("mkdir -p #{archive_contents}")
  system("tar -zxf #{archive} --strip-components=1 -C #{archive_contents}")

  puts "Mixing documentation…"
  data_file = "data/bourbon_#{version_slug}.json"
  system("npx sassdoc #{archive_contents}/core -p > #{data_file}")

  puts "Cleaning up…"
  system("rm -rf #{workspace}")

  puts "All done!"
  puts "Documentation written to: #{data_file}"
end
