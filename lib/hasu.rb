require "hasu/version"
require "hasu/window"

module Hasu
  def self.reloads
    @files ||= {}
  end

  def self.load(path)
    reloads[path] = File.exists?(path) ? File.mtime(path) : Time.now
    begin
      super
      true
    rescue Exception => e
      Hasu.error = e
      false
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

  def self.reload!
    to_reload = reloads.select{|f,t| File.exists?(f) && File.mtime(f) > t}

    !to_reload.empty? && to_reload.all? do |file,_|
      puts "Reloading #{file}"
      load(file)
    end
  end
end
