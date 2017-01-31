class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :validatable
  has_many :messages, foreign_key: "author_id"
end
