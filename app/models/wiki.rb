class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators, dependent: :destroy

  scope :visible_to, -> (user) { user && user.standard? ? where(private: false) : all }


end
