#!/usr/bin/env ruby -w
=begin
Creates symbolid links to a long existing filename from simlified filename like IHE-PCD-CP-151.docx
to a related file with a less handy filename by finding the longer, hard to type

TODO:
 - It should not create a link if a valid one exists
=end

# @param [Object] old_filename
def make_simple_filename (old_filename)

  unless File.exist?(old_filename)
    puts "#{old_filename} does not exist. Please try again."
    exit
  end

  name = File.basename(old_filename, ".*")
  ext = File.extname(old_filename)

  suffix = '00'
  re_suffix = /_(\d{2,3})$/
  m_suffix = re_suffix.match(name)
  if m_suffix
    suffix = m_suffix[1]
  end

  re = /(?<prefix>CP-PCD-)(?<piv>PIV-)?(?<cp_num>\d*)/
  m = re.match(name)
  if m
    # puts "ln " + m[:prefix] + m[:cp_num] + "-01" + ext + " " + old_filename

    # puts "mv '#{old_filename}' #{name + ext}"

    puts "ln -s #{old_filename} #{m[:prefix]}#{m[:cp_num]}-#{suffix}#{ext}"

  end
end

puts("starting")
filenames = Dir["*.docx"]

filenames.map { |f| make_simple_filename(f) }


