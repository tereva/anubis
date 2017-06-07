class Site < ApplicationRecord
 
  belongs_to :category

  def trash_it_now
    self.category_id = 1
    self.save
  end


def self.search(search)
  if search
    #find_by_sql("SELECT * FROM sites WHERE MATCH (description,kw,title) AGAINST ('?')",search)
    find_by_sql ["SELECT * FROM sites WHERE MATCH (description,kw,title) AGAINST (:search)", 
      {:search => search}]
    #find_by_sql("SELECT * FROM sites WHERE MATCH (description,kw,title) AGAINST ('hotel tahiti')")
  	#where("category_id >2 AND description LIKE :search", {:search => "%#{search}%"})
   #find(:all, :conditions => ['description LIKE ?', "%#{search}%"])
   #find(:all, :conditions => [ "category_id IS NOT NULL AND category_id != 1 AND category_id != 2"])
  else
    find(:all)
  end
end

def self.approved
where('category_id IS NOT NULL AND category_id != 1 AND category_id != 2')
end



end
