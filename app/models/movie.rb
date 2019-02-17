class Movie < ActiveRecord::Base
    # Code below Feb 16
   def self.allRatings
       ['G','PG','PG-13','R']
   end
    
   def self.with_ratings(ratings)
       self.where(ratings: @ratings)
   end
# Code above Feb 16  
end
