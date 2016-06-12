require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    self.all.last
  end

  def self.new_by_name(title)
  song = self.create
  song.name=(title)
  song
  end

  def self.create_by_name(song_name)
    self.new_by_name(song_name)
  end

  def self.find_by_name(song_title)
      self.all.each do |each_song| 
      if each_song.name == song_title
        return each_song
      end
    end
  end

  def self.find_or_create_by_name(song)
    self.find_by_name(song) == [] ? self.create_by_name(song) : self.find_by_name(song)
  end

  def self.alphabetical
    self.all.sort_by{|song_instance| song_instance.name}
  end

  def self.new_from_filename(song_file)
    song_info = song_file.split(".")
    song_details = song_info[0]
    song_array = song_details.split(" - ")
    artist = song_array[0]
    song_name = song_array[1] 
    song = self.new 
    song.name=(song_name)
    song.artist_name=(artist)
    song
  end

  def self.create_from_filename(song_file)
    song_instance = self.new_from_filename(song_file)
    song_instance.save
  end

  def self.destroy_all
    self.all.clear
  end
end
