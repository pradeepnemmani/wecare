# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  micropost_id :integer
#  comment      :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :comment, :micropost_id, :user_id
  belongs_to :micropost

  validates :user_id,  :presence => true

  validates :comment,  :presence => true,
  						:length => { :maximum => 100}
end
