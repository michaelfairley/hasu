require "hasu/version"
require "hasu/window"
require "listen"

module Hasu
  def self.watch path
    dir_path = File.expand_path File.dirname(path)
    Listen.to(dir_path, ignore: /#{path}/) do |modified, added, _|
      [modified,added].flatten.each {|file|
        puts "Reloading #{file}"
        load file
      }
      @window and @window.reset
    end
  end

  def self.window=(window)
    @window = window
  end

  def self.window
    @window
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
