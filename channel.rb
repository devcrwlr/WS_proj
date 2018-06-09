require "mp3info"
require 'fileutils'

def getmp3Info(path,foldername,songtitle)
	Mp3Info.open("#{path}#{foldername}/Tracks/#{songtitle}") do |mp3info|
		if mp3info.channel_mode == "Single Channel"
			puts ">> /Tracks/#{songtitle}\n\n"
			unless songtitle.include? "mono_"
				File.rename("#{path}#{foldername}/Tracks/#{songtitle}","#{path}#{foldername}/Tracks/mono_#{songtitle}")
				if File.exist? "convert.sh"
					FileUtils.rm("convert.sh")
				end
				File.open("convert.sh","a+") do |file|
					file.puts("ffmpeg -i \"#{path}#{foldername}/Tracks/mono_#{songtitle}\" -ac 2 -ab 320000 -ar 48000 \"#{path}#{foldername}/Tracks/#{songtitle}\" && rm \"#{path}#{foldername}/Tracks/mono_#{songtitle}\"")
			end
			end
		end
	end
end

puts "Now searching for mp3 file with channel type MONO ..."
path = "_wesing/wesingBatchDownload/"

files = Dir.entries(path)
files.each do |foldername|
	unless foldername == "." || foldername == ".." or foldername.to_s.match? "xlsx"
		puts ">> #{path+foldername}"
		tracks = Dir.entries("#{path}#{foldername}/Tracks")
		tracks.each do |mp3title|
			unless mp3title == "." || mp3title == ".."
				getmp3Info(path,foldername,mp3title)
			end
		end
	end
end
