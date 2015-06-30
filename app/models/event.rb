class Event < ActiveRecord::Base
  attr_accessible :description, :end_date, :name, :on_date, :user_id
  belongs_to :user
   validates :name, :presence		=> true,
   					:length => { :maximum => 50}


   	validates :description,	:presence  => true,
   							:length => { :maximum => 1000}


   	validates  :on_date,	:presence	=> true
   	validates  :end_date, 	:presence	=> true

   	validates  :user_id, 	:presence	=> true

end
