class User < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  before_validation :construct_api_key, on: :create
  validates_presence_of :api_key

  def construct_api_key
    api_key = Digest::MD5.hexdigest(Time.now.to_s + "#{self.name}#{self.email}")
  end
end
