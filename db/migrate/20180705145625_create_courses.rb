class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.text "description", :null => false
      t.string "name", :null => false
      t.decimal "price", :null => false
      t.integer "capacity", :null => false
      t.timestamps
    end
    create_table :users_courses, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :course, index: true
    end
  end
end
