class Song < ApplicationRecord

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when ".csv" then Roo::Csv.new(file.path)
	  when ".xls" then Roo::Excel.new(file.path)
	  when ".xlsx" then Roo::Excelx.new(file.path)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	end



	def self.import(file)
		#Set date
		$time = Time.now.strftime("%Y/%m/%d")
		$time = $time.split("/")
		$time = $time[0]+$time[1]+$time[2]

		$list_songs = []

			if file != nil
  		spreadsheet = open_spreadsheet(file)

  		spreadsheet.each do |file_rows|

      	$list_songs << file_rows

     	end

     	counter = 3

	    total_count = $list_songs.length

	    array_count = []
	    songandsingerlist = []
	    $albumlist = []
	    songandsinger = {}

	    if songandsingerlist != nil
	    	songandsingerlist.clear
	    	array_count.clear
	    end

	    while counter < total_count  do

	    	 song_counter = $list_songs[counter].to_a[0]

	    	 song_name = $list_songs[counter].to_a[1]
				 singer_name = $list_songs[counter].to_a[2]
				 album_name = $list_songs[counter].to_a[18]

				 #CODES TO CAPITALIZE TITLE
				 #if song_name.to_s.include?(" ")
					 #song_name = song_name.split(" ").map{|word| word.capitalize}.join(" ")
				 #end

				 #if singer_name.to_s.include?(" ")
					 #singer_name = singer_name.split(" ").map{|word| word.capitalize}.join(" ")
				 #end

				 #unless album_name == "N/A" || album_name == nil
				 	 #album_name = album_name.split(" ").map{|word| word.capitalize}.join(" ")

				 #CODES TO REPLACE SPECIAL CHARACTER WHEN CREATING FOLDER
				 if song_name.include?(":") || singer_name.include?(":") || album_name.include?(":")

					 song_name = song_name.gsub(":"," ")
					 singer_name = singer_name.gsub(":"," ")
					 album_name = album_name.gsub(":"," ")

				 elsif song_name.include?("|") || singer_name.include?("|") || album_name.include?("|")

					 song_name = song_name.gsub("|"," ")
					 singer_name = singer_name.gsub("|"," ")
					 album_name = album_name.gsub("|"," ")

				 elsif song_name.include?("?") || singer_name.include?("?") || album_name.include?("?")

					 song_name = song_name.gsub("?"," ")
					 singer_name = singer_name.gsub("?"," ")
					 album_name = album_name.gsub("?"," ")

				 elsif song_name.include?("*") || singer_name.include?("*") || album_name.include?("*")

					 song_name = song_name.gsub("*"," ")
					 singer_name = singer_name.gsub("*"," ")
					 album_name = album_name.gsub("*"," ")

				 end

				 #end

	    	 language = $list_songs[counter].to_a[11]
	    	 lyricSource = $list_songs[counter].to_a[4]
	    	 mp3Source = $list_songs[counter].to_a[5]
	    	 mp4Source = $list_songs[counter].to_a[6]
	    	 karaokeSource = $list_songs[counter].to_a[7]
	    	 image_album = $list_songs[counter].to_a[8]
	    	 image_singer = $list_songs[counter].to_a[9]
				 name_of_package = $list_songs[counter].to_a[3]
				 source_of_songlist = $list_songs[counter].to_a[10]
				 genre_of_song = $list_songs[counter].to_a[12]
				 version = $list_songs[counter].to_a[13]
				 operator_name = $list_songs[counter].to_a[14]
				 origin_of_singer = $list_songs[counter].to_a[15]
				 gender_of_singer = $list_songs[counter].to_a[16]
				 type = $list_songs[counter].to_a[17]
				 genre_of_singer = $list_songs[counter].to_a[19]
				 release_time_of_album = $list_songs[counter].to_a[20]
				 release_company_of_album = $list_songs[counter].to_a[21]
				 record_label_for_singer = $list_songs[counter].to_a[22]
				 album_composition = $list_songs[counter].to_a[23]
				 album_type = $list_songs[counter].to_a[24]
				 album_intro = $list_songs[counter].to_a[25]
				 singer_intro = $list_songs[counter].to_a[26]
				 date_of_death = $list_songs[counter].to_a[27]
				 birthday = $list_songs[counter].to_a[28]
				 note = $list_songs[counter].to_a[29]
				 instrument_type = $list_songs[counter].to_a[30]
				 movie_tv = $list_songs[counter].to_a[31]
				 date_of_delivery = $list_songs[counter].to_a[32]

				 	$albumlist << album_name

	         songandsingerss = {"index"=> counter,
						 					"counter" => song_counter,
           						"song_name" => song_name,
           						"singer_name" => singer_name,
											"name_of_package" => name_of_package,
											"lyrics" => lyricSource,
           						"mp3" => mp3Source,
           						"mp4" => mp4Source,
           						"karaoke" => karaokeSource,
           						"image_album" => image_album,
           						"image_singer" => image_singer,
											"source_of_songlist" => source_of_songlist,
											"language" => language,
											"genre_of_song" => genre_of_song,
											"version" => version,
											"operator_name" => operator_name,
											"origin_of_singer" => origin_of_singer,
											"gender_of_singer" => gender_of_singer,
											"type" => type,
											"album_name" => album_name,
											"genre_of_singer" =>  genre_of_singer,
											"release_time_of_album" => release_time_of_album,
											"release_company_of_album" => release_company_of_album,
											"record_label_for_singer" =>  release_company_of_album,
											"album_composition" => album_composition,
											"album_type" => album_type,
											"album_intro" => album_intro,
											"singer_intro" => singer_intro,
											"date_of_death" => date_of_death,
											"birthday" => birthday,
											"note" => note,
											"instrument_type" => instrument_type,
											"movie_tv" => movie_tv,
											"date_of_delivery" => date_of_delivery
           					}


# CODES TO CREATE FOLDER
#           	if $album_name != nil
#           		directory_name = "#{ENV['HOME'] + '/Desktop/Test_crwlr'}/#{$album_name} - #{$singer_name}"
#				Dir.mkdir(directory_name) unless File.exists?(directory_name)
#           	else
#           		directory_name = "#{ENV['HOME'] + '/Desktop/Test_crwlr'}/#{$song_name} - #{$singer_name}"
#				Dir.mkdir(directory_name) unless File.exists?(directory_name)
#          	end

			require 'fileutils'

			main_folder = "_wesing/wesingBatchDownload/PH Delivery Total_#{$list_songs.size-3}_Songs_#{$time}"
			sub_folder = "wesingBatchDownload/PH Delivery Total_#{$list_songs.size-3}_Songs_#{$time}"
			FileUtils.mkpath(main_folder)
			$directory_info = "#{main_folder}/Info"
			FileUtils.mkpath($directory_info)
			$directory_lyrics = "#{main_folder}/Lyrics"
			FileUtils.mkpath($directory_lyrics)
			$directory_tracks = "#{main_folder}/Tracks"
			$subdirectory_track = "#{sub_folder}/Tracks"

			FileUtils.mkpath($directory_tracks)



	         songandsingerlist << songandsingerss

	         $songandsingerlist = songandsingerlist

	         counter +=1
	    end

     	$countsongs = "Total count [#{$list_songs.count - 3}]"
			$countsong = "Total_#{$list_songs.count - 3}"


    end

    def self.clear
    	$songandsingerlist.clear
    end

end



end
