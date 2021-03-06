class Message < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  validates :title, presence: true
  scope :between, -> (author_id, recipient_id) do
    includes(:author).where("(author_id = ? AND recipient_id = ?) or (author_id = ? AND recipient_id = ?)", author_id, recipient_id, recipient_id, author_id)
  end

  def recipient
    User.find(recipient_id)
  end
end
