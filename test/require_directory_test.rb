require File.dirname(__FILE__) + '/test_helper.rb'

class TestDirectoryRequires < Test::Unit::TestCase

  def test_require_directory_good
    require_directory  File.dirname(__FILE__) + '/sample_requires'
    %w{ Widgets Things Stuff Jimmy }.each do |cl|
      assert Object.const_defined?(cl.to_sym)
      assert_equal Class, eval("#{cl}").class
    end
  end

  def test_require_directory_bad
    begin
    assert_raises(Exception) do
      require_directory  File.dirname(__FILE__) + '/sample_requires_with_error'
    end
    rescue Exception => e
      assert e.kind_of?(Exception)
    end
  end

end
