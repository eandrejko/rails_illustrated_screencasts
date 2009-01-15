class Contact < ActiveRecord::Base
  
  # number of items per page
  def self.per_page
    5
  end
  
end
