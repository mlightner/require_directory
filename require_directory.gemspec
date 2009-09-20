Gem::Specification.new do |s|
	s.name = %q{require_directory}
	s.version = "0.1.0"
	s.author = "Matt Lightner"
	s.default_executable = %q{require_directory}
	s.description = %q{Require all files in a directory easily.}
	s.email = %q{mlightner@gmail.com}
  s.files = ["./README","./lib","./lib/rails_search.rb","./lib/require_directory.rb","./lib/rails_search","./old","./old/lib","./old/lib/zip_code.rb","./test","./test/test_directory_reqiire.rb","./test/sample_requires","./test/sample_requires/things.rb","./test/sample_requires/stuff.rb","./test/sample_requires/widgets.rb","./test/sample_requires_with_error","./test/sample_requires_with_error/gremlins.rb","./test/sample_requires_with_error/things.rb","./test/sample_requires_with_error/stuff.rb","./test/sample_requires_with_error/widgets.rb","./test/test_helper.rb","./Rakefile","./require_directory.gemspec"]
	s.has_rdoc = false
	s.homepage = %q{http://github.com/mlightner/require_directory}
	s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "require_directory", "--main"]
	s.require_paths = ["lib"]
	s.summary = %q{Require all files in a directory.}
end
