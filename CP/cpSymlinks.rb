#!/usr/bin/env ruby -w

def fixFilename old_filename 

  unless File.exist?(old_filename)
    puts "#{old_filename} does not exist. Please try again."
    exit
  end

  name = File.basename(old_filename, ".*")
  ext = File.extname(old_filename)

  replacements = { /;/ => "-",
                   /\s/ => "_",
                   /\'\`/ => "=",
                   /\&/ => "dollar+",
                   /%/ => "_percent",
                   /[\(\)\[\]<>]/ => ""
                }

  replacements.each do |orig, fix|
    name.gsub!(orig,fix)
  end

  if old_filename != name + ext
    puts "mv '#{old_filename}' #{name + ext}"

  end
end

filenames = Dir["*"]

filenames.map { |f| fixFilename f }


