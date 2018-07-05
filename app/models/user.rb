class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :courses
  has_attached_file :avatar, styles: { medium: "500x500", thumb: "300x300" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
  # Explicitly do not validate
  do_not_validate_attachment_file_type :avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
