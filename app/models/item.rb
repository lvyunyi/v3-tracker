class Item < ActiveRecord::Base
	validates :content, presence: true
	validates_inclusion_of :status, :in => [true, false]

	after_initialize :default_values 
	  def default_values 
	    self.status ||= false 
	  end 
end
