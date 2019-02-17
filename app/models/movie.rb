class Movie < ActiveRecord::Base
    # Code below Feb 16
  def order_list(sort_by)
    if sort_by =='title'
      self.movies.order(title: :asc)
    elsif sort_by == 'release_date'
      self.movies.order(release_date: :asc)
    else
      self.movies.order(created_at: :asc)
    end
  end
# Code above Feb 16  
end
