class Site < ApplicationRecord
 
  belongs_to :category
  has_many :locations, validate: false, dependent: :destroy

  validates :title, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :web, presence: true, uniqueness: true
  validates :kw, presence: true, format: { with:/\A[a-z\s]*(,[a-z\s]*)*\z/,
    message: "mots sans accents separés par une virgule" }
    # Regex acceptant les espaces, moins contraigant : /\A[a-z\s]*(,[a-z\s]*)*\z/
    # Regex contraingante : mot1,mot2 mot2,mot3 /\A[a-z]+(\s[a-z]+)*(,[a-z]+(\s[a-z]+)*)*\z/

  validates :description, presence: true
  


  accepts_nested_attributes_for :locations, allow_destroy: true




 #def hit
 #   self.hit++
  #end


  def trash_it_now
    self.category_id = 1
    self.save
  end


def self.search(search)
  if search
    #find_by_sql("SELECT * FROM sites WHERE MATCH (description,kw,title) AGAINST ('?')",search)
    find_by_sql ["SELECT * FROM sites WHERE category_id > 2 AND 
       MATCH (title,description,kw) AGAINST (:search)", {:search => search}]
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


def self.standbyed
where('category_id IS NULL OR category_id = 2')
end

def self.trashed
where('category_id = 1')
end



end
