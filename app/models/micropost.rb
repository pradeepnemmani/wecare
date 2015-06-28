class Micropost < ActiveRecord::Base

  attr_accessible :description, :name, :user_id

  belongs_to :user

	validates :name, :presence => true, 
					 :length => { :maximum => 50}

	validates :user_id, :presence => true

	validates :description, :presence => true,
							:length => { :maximum => 150}

  default_scope  :order => 'microposts.created_at DESC'


end
