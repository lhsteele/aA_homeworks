#has name and house_id attributes
#belongs to a house => belongs_to

class Person < ActiveRecord::Base 
  validates :name, :house, presence: true 

  belongs_to :house, 
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'

end