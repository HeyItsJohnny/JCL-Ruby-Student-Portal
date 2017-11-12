class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.date   :birthday
      t.text   :address
      t.string :studentid

      t.timestamps
    end
  end
end
