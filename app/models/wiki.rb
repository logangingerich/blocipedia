class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :visible_to, -> (user) { user && user.standard? ? where(private: false) : all }
end
