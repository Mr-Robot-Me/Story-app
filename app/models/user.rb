class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stories, dependent: :destroy
  validates :firstname, presence: true
  validates :firstname, uniqueness: true
  validates :lastname, presence: true       
end
