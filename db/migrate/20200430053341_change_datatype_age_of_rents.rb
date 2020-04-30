class ChangeDatatypeAgeOfRents < ActiveRecord::Migration[5.2]
  def change
    change_column :rents, :age, :integer
  end
end
