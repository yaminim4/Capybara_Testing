class Goal < ActiveRecord::Base
  validates :body, :user, :title, presence: true


  belongs_to :user
end
