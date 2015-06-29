class Comment < ActiveRecord::Base
  attr_accessible :comment, :micropost_id, :user_id
  belongs_to :micropost

  validates :user_id,  :presence => true

  validates :comment,  :presence => true,
  						:length => { :maximum => 20}
end
