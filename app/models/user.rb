class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :owned_projects, class_name: "Project", foreign_key: :user_id, dependent: :destroy
  has_one_attached :photo

  has_many :user_projects
  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects
  has_many :ideas, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :messages, dependent: :destroy
end
