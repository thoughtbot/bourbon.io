desc "Generate documentation for a published version of Bourbon"
task :generate_docs_for do
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
    assets_dir = "#{downloaded_dir}/core"
    new_file = "data/bourbon_#{version_number}.json"
    system("npx sassdoc #{assets_dir} -p > #{new_file}")

    puts "cleaning up"
    system("rm -rf bourbon.tar.gz")
    system("rm -rf #{downloaded_dir}")

    puts "all done!"
    puts "please check the new file: #{new_file}"
  end
end
