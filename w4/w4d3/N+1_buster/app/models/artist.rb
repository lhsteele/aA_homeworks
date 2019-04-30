# == Schema Information
#
# Table name: artists
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    # TODO: your code here
    #want to return each album with a hash of album => num_of_tracks

    #1 => how does the count(*) work here? As it's the second argument, does it know that it's counting what's in the group?
    #2 => is the .select("albums.*") saying 'for each album in the array of Album objects, do the following' ?
    #3 => can I think of this as calling .albums 'joins' me to the albums table, and then joins(:tracks) 'joins' me to the tracks table
    #     now I have access to everything in the tracks table, like album_id
    #4 => is the count(*) a way to get around the issue of grouping by something but wanting to actually count the elements inside it?
    #      (on questions like wanting to order movies by cast size - I often run into errors where I'll group by movie, but then when I 
    #       try to count by the cast_id or actor_id, I can't because those elemenst have been 'collapsed' inside the movie group)
    
    albums = self
      .albums
      .select("albums.*, count(*) as tracks_count")
      .joins(:tracks)
      .group('albums.id')

    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks_count
    end
  end
end
=begin
a.albums
  .select("albums.*, count(*) as tracks_count")
  .joins(:tracks)
  .group('albums.id')
  
returned => 
#<ActiveRecord::AssociationRelation 
[#<Album id: 1, title: "Lemonade", artist_id: 1, created_at: "2019-04-03 19:15:05", updated_at: "2019-04-03 19:15:05">, 
#<Album id: 2, title: "I Am... Sasha Fierce", artist_id: 1, created_at: "2019-04-03 19:15:05", updated_at: "2019-04-03 19:15:05">, 
#<Album id: 3, title: "Dangerously in Love", artist_id: 1, created_at: "2019-04-03 19:15:05", updated_at: "2019-04-03 19:15:05">, 
#<Album id: 4, title: "B'Day", artist_id: 1, created_at: "2019-04-03 19:15:05", updated_at: "2019-04-03 19:15:05">, 
#<Album id: 5, title: "4", artist_id: 1, created_at: "2019-04-03 19:15:05", updated_at: "2019-04-03 19:15:05">]>
end
