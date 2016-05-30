class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  attr_accessible :name,:email,:dob,:phone,:password,:gender

  validates :phone, presence: true, length: {minimum:10 , maximum: 11 }
  validates :name, presence: true, length: {minimum: 6, maximum: 30 }
end
