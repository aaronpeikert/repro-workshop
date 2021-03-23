#!/usr/bin/env ruby
# delets everything that is in .gitignore except pdf

gitignore = File.open(".gitignore").readlines
gitignore.each do |pattern|
  files = Dir.glob(pattern.strip)
  filesWithoutPDF = files.select{ |i| !i[/\.pdf$/] }
  filesWithoutPDF.each {|file| File.delete(file)}
end
