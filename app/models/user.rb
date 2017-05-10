class User < ActiveRecord::Base
  has_many :books
  has_secure_password

  validates_presence_of :username, :email, :password_digest

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
