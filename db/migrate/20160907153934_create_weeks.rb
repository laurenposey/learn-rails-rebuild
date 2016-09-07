class CreateWeeks < ActiveRecord::Migration[5.0]
  def change
    create_table :weeks do |t|
      t.integer :number
      t.string :title
      t.integer :course_id

      t.timestamps
    end
  end
end
