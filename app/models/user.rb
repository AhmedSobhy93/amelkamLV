class User < ActiveRecord::Base

  #include Mongoid::Document

  acts_as_token_authenticatable
  #field :authentication_token

  # Include default devise modules.
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable,
  #       :confirmable, :omniauthable
  #include DeviseTokenAuth::Concerns::User

  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, :omniauth_providers => [:facebook]


  attr_accessible :name,:email,:dob,:phone,:password,:gender, :remember_me, :avatar, :avatar_cache, :remove_avatar
  
  has_many :prices
  has_many :comments
  



  #validates :phone, presence: true, length: {minimum:10 , maximum: 11 }
  #validates :name, presence: true, length: {minimum: 6, maximum: 30 }

  # validates_presence_of   :avatar
  # validates_integrity_of  :avatar
  # validates_processing_of :avatar

  ratyrate_rater

 

end
