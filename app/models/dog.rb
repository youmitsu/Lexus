class Dog < ActiveRecord::Base
  belongs_to :user
  belongs_to :dog_type
end
