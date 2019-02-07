class User < ApplicationRecord

  has_secure_password

  validates :first_name,
    presence: true,
    length: { in: 2..14 }
  validates :last_name,
    presence: true,
    length: { in: 2..14 }
  validates :email,
    presence: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  


  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
end
