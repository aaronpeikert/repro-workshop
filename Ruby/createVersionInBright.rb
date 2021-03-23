#!/usr/bin/env ruby
# modify LaTeX file so that it creates a handout with notes

ifilename = ARGV.length > 0 ? ARGV[0] : "openaccess.tex"
ofilename = ARGV.length > 1 ? ARGV[1] : ifilename.sub(".tex", "_bright.tex")

ifile = File.open(ifilename)
ofile = File.open(ofilename, "w")

ifile.readlines.each do |z|
  ofile.write("\\def\\notescolors{1}\n") if /^\\input{/ =~ z # add line saying to use notes colors
  ofile.write(z)
end
