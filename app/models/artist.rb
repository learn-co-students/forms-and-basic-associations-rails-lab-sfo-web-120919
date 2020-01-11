class Artist < ActiveRecord::Base
  # add associations here
  has_many :songs
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