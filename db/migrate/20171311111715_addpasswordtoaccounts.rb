class Addpasswordtoaccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :password, :text
  end
end
