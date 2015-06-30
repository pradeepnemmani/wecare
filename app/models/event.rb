class Event < ActiveRecord::Base
  attr_accessible :description, :end_date, :name, :on_date, :user_id
  belongs_to :user
   validates :name, :presence		=> true,
   					:length			=> {:minimum => 5,:maximum => 50}

   	validates :description,	:presence  => true,
   							:length		=> {:minimum => 100, :maximun => 300}

   	validates  :on_date,	:presence	=> true
   	validates  :end_date, 	:presence	=> true

   	validates  :user_id, 	:presence	=> true

end
