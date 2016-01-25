require "bundler"

task :default => [:generate]

desc "generate a docco json output file for the gem version defined in Gemfile"
task :generate do
  bourbon_path = Bundler.load.specs.find{|s| s.name == "bourbon" }.full_gem_path

  assets_dir = "#{bourbon_path}/app/assets/stylesheets"

  # ~/.gem/ruby/2.2.0/gems/bourbon-4.2.1 => "4_2_1"
  version_number = bourbon_path.scan(/(\d\.\d\.\d)+/).last.last.gsub(/\./, "_")

  system("sassdoc #{assets_dir} -p > data/bourbon_#{version_number}.json")
end

desc "generate docs for a specific version number"
task :generate_for do
  ARGV.each { |a| task a.to_sym do ; end }
  number = ARGV[1]

  fail "\nplease provide version number\n\n" unless number

  puts "downloading version #{number}"
  system("curl -L https://api.github.com/repos/thoughtbot/bourbon/tarball/v#{number} > bourbon.tar.gz")

  system("tar -zxf bourbon.tar.gz")

  downloaded_dir = Dir['**'].last
  version_number = number.gsub(/\./, "_")

  if downloaded_dir =~ /thoughtbot-bourbon-/

    puts "mixing documentation for bourbon #{number}"
    assets_dir = "#{downloaded_dir}/app/assets/stylesheets"
    new_file = "data/bourbon_#{version_number}.json"
    system("sassdoc #{assets_dir} -p > #{new_file}")

    puts "cleaning up"
    system("rm -rf bourbon.tar.gz")
    system("rm -rf #{downloaded_dir}")

    puts "all done!"
    puts "please check the new file: #{new_file}"
  end
end
