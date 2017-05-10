class User < ActiveRecord::Base
  has_many :books
  has_secure_password

  validates :username, :email, :password, presence: true

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
