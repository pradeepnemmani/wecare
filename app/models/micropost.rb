# == Schema Information
#
# Table name: microposts
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Micropost < ActiveRecord::Base

  attr_accessible :description, :name, :user_id

  belongs_to :user
  has_many :comments

	validates :name, :presence => true, 
					 :length => { :maximum => 50}

	validates :user_id, :presence => true

	validates :description, :presence => true,
							:length => { :maximum => 150}

  default_scope  :order => 'microposts.created_at DESC'


end
