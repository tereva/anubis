class Site < ApplicationRecord
 
  belongs_to :category

  def trash_it_now
    self.category_id = 1
    self.save
  end



end
