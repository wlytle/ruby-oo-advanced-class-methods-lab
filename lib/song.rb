require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ? song : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file_name)
    song = self.new
    song.parse_file_name(file_name)
    song
  end
  
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

  def initialize
  end
  
  def save
    self.class.all << self
  end
  
  def parse_file_name(file_name)
    file_split = file_name.split(" - ")
    self.artist_name = file_split[0] 
    self.name = file_split[1].split(".")[0]
  end
end
