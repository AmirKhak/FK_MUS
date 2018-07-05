class AddAvatarToUserAndCourse < ActiveRecord::Migration[5.1]
  def change
    add_attachment :users, :avatar
    add_attachment :courses, :avatar
  end
end
