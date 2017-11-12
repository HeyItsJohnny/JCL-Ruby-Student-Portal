class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :subject
      t.text   :content
      t.string :userid
      t.integer :student_id
      t.belongs_to :student, index: true
      t.timestamps
    end
  end
end
