class Conversation < ApplicationRecord
  belongs_to :sender, class_name: "Users", foreign_key: "sender"
  belongs_to :receiver, class_name: "Users", foreign_key: "receiver"

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender, scope: :receiver

  scope :between, -> (sender, receiver) do
  where("(conversations.sender = ? AND conversations.receiver = ?)
  OR (conversations.receiver = ? AND conversations.sender = ?)",
  sender, receiver, sender, receiver)
  end



end
