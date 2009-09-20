require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Test the library.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end
task :default => [':test']

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
