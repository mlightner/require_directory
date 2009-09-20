$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module RailsSearch
  VERSION = '0.0.1'
end


class RailsSearch

  VERSIONS = {}

  class self <<

    def versions
      find_sources unless @@versions
      @@versions
    end

    def find_sources
      @@versions = Hash.new
      gemdirs = `/usr/bin/env gem env gempath`.strip.split(/\:/)
      gemdirs.each do |d|
         Dir["#{d}/gems/rails-*"].each do |rd|
           @@versions[$1.to_s] = rd if rd =~ /\/rails\-([^\s]+)\s*$/)/i
         end
      end
    end

    def by_module(mod)
      
    end
  end

end
