require 'rake'
require 'albacore'

@root_directory = File.dirname __FILE__

task :default => [:build]

msbuild :build do |t|
  t.solution = File.join @root_directory, 'SublimeLogger', 'SublimeLogger.sln'
end