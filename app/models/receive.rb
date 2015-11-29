class Receive < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'receive_user_id'
  belongs_to :request
end
