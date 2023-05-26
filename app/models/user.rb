class User < ApplicationRecord
has_one :profile
has_many :books
has_many :orders



    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :active, presence: true

end
