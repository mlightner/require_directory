require 'rubygems'
# Gem::manage_gems is deprecated

require 'rake/rdoctask'
require 'rake/packagetask'
require 'rake/gempackagetask'
require 'rake/testtask'
require 'rake/contrib/rubyforgepublisher'

PKG_NAME        = 'require_directory'

specfile = File.read(File.dirname(__FILE__) + '/require_directory.gemspec')

eval(specfile, binding)

task :default => ['test']


desc 'Test the library.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc "Update gem files list"
task :gemfiles do
  file_name = "require_directory.gemspec"
  files = `find ./ | grep -v \.git`.each_line.collect { |f| f.strip }.reject { |e| e =~ /^[^\W]*$$/  }
  files.shift
  file = File.new(file_name)
  lines = file.readlines
  file.close

  newf = []
  lines.each do |line|
    if line =~ /^\s+s\.files\s*\=/
      newf.push "  s.files = [\"#{files.join('","')}\"]\n"
    else
      newf.push(line.rstrip + "\n")
    end
  end

  # Don't write the file if there are no changes
  file = File.new(file_name,'w')
  newf.each do |line|
    file.write(line)
  end
  file.close
end

desc 'Generate documentation for require_directory.'
Rake::RDocTask.new do |rd|
  rd.rdoc_dir = 'html'
  rd.rdoc_files.include("README.rdoc", "LICENSE", "lib/**/*.rb")
  rd.main = "README.rdoc"
  rd.title    = "#{PKG_NAME} -- Require all files in a directory recursively."
  rd.options << "--all"
end

desc 'Publish the current version to GitHub.'
task :github do
  require 'readline'
  message = Readline::readline('Describe changes: ')
  raise "Couldn't add current changes." unless system("git add .")
  raise "Couldn't commit changes with message." unless system("git", "commit", "-m", message)
  raise "Couldn't push changes to GitHub." unless system("git push origin master")
  puts "Changes published to GitHub."
end

