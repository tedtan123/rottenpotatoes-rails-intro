class Movie < ActiveRecord::Base
    # Code below Feb 16
  def order_list(sort_by)
    if sort_by =='title'
      Movie.order(title: :asc)
    elsif sort_by == 'release_date'
      Movie.order(release_date: :asc)
    else
      Movie.order(created_at: :asc)
    end
  end
# Code above Feb 16  
end
