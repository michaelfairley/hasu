require "hasu/version"
require "hasu/window"
require "listen"

module Hasu
  def self.watch path
    abs_path = File.expand_path File.dirname(path)
    Listen.to(abs_path, ignore: /#{path}/) do |modified, added, removed|
      [modified,added,removed].flatten.each {|file|
        puts "Reloading #{file}"
        load file
      }
    end
  end

  def self.error
    @error
  end

  def self.error=(error)
    @error = error

    if @error
      $stderr.puts @error.inspect
      $stderr.puts @error.backtrace.join("\n")
    end
  end
end
