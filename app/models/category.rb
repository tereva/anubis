class Category < ApplicationRecord



def self.public
where('id != 1 AND id != 2')
end

end
