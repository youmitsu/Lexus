class Request < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: 'request_user_id'
  has_many :receives, class_name: "Receive", foreign_key: 'request_id'
  has_many :users, through: :receives
end
