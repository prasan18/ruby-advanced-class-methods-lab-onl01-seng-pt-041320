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
    #@@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|x| x.name == name}
  end
  
  def self.find_or_create_by_name(name)
      #if self.find_by_name(name) == nil 
        #self.create_by_name(name)
      #else
        #self.find_by_name(name)
      #end
      self.find_by_name(name) || self.create_by_name(name)
      #the above statement is saying do this(if it is true) or that (if the first thing is not true and the second thing is true)
  end
  
  def self.alphabetical()
    #returns all the songs instances in ascending (a-z) alphabetical order.
    @@all.sort_by{|x| x.name}
  end
  
  
  def self.new_from_filename(name)
    song = self.new 
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end
  
  def self.create_from_filename(name)
  #class method should not only parse the filename correctly but should also save the song
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    song
  end
  
  def self.destroy_all()
    #reset the state of the @@all class variable to an empty array thereby deleting all previous song instances.
    @@all.clear
  end

end



#this is for the create_from_filename method & destroy_all
#song = Song.create_from_filename("Taylor Swift - Blank Space.mp3")
#song = Song.create_from_filename("Test 02 - Test_02.mp3")
#song = Song.create_from_filename("Test 03 - Test_03.mp3")
#puts Song.all.inspect
#Song.destroy_all
#puts Song.all.inspect

#song.name #=> "Blank Space"
#song.artist_name #=> "Taylor Swift"


#this is for new_from_filename method
#song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
#song.name #=> "Blank Space"
#song.artist_name #=> "Taylor Swift"


#this is for the alphabetical method
#song = Song.create_by_name("Cranberry")
#song = Song.create_by_name("Apples")
#song = Song.create_by_name("Berry")
#Song.alphabetical


#this is for the find_or_create_by_name method
song_1 = Song.find_or_create_by_name("Blank Space")
song_2 = Song.find_or_create_by_name("Blank Space")