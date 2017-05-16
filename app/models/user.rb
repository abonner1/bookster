class User < ActiveRecord::Base
  has_many :books
  has_secure_password

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
