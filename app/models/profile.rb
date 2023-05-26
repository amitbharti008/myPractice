class Profile < ApplicationRecord

    belongs_to :user

    validates :address, presence: { message: "can't be blank" }
    validates :phone_number, presence: true, numericality: { only_integer: true }
    validates :city, presence: { message: "can't be blank" }
    validates :state, presence: { message: "can't be blank" }
    validates :country, presence: { message: "can't be blank" }




end
