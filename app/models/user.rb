class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :validatable
  has_many :messages, foreign_key: "author_id"

  def collect_unread
    Message.where("read = ? and recipient_id = ?", false, self.id)
  end
end
