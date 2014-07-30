class CreatePomodoros < ActiveRecord::Migration
  def change
    create_table :pomodoros do |t|
      t.string :user
      t.string :task
      t.text :description
      t.text :comments

      t.timestamps
    end
  end
end
