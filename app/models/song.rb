class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

   

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  

end

# - `Artist`
#   - has a `name` attribute (`String`)
#   - has many `Song`s
# - `Song`
#   - has a `title` attribute (`String`)
#   - belongs to an `Artist`
#   - belongs to a `Genre`
#   - has many `Note`s
# - `Genre`
#   - has a `name` attribute (`String`)
#   - has many `songs`
