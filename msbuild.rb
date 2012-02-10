file = ARGV[0]

def execute_msbuild(build_file)
  puts `c:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319\\MSBuild.exe #{build_file} /noconsolelogger /logger:C:\\src\\3rdParty\\SublimeLogger\\bin\\Debug\\SublimeLogger.dll`
end

class File
  def self.find(dir, pattern="*.*")
    Dir[ File.join(dir.split(/\\/), pattern) ]
  end
end

path_parts = File.split file
begin
  directory = path_parts[0]
  build_proj = File.join directory, 'build.proj'
  if File.exists? build_proj
    execute_msbuild build_proj
    break
  end

  csproj_files = File.find directory, "*.csproj"
  if csproj_files.any?
    execute_msbuild csproj_files[0]
    break
  end

  path_parts = File.split file
end until path_parts[1] == "\\"