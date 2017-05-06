class User < ActiveRecord::Base
  has_many :books
  has_secure_password

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
