class CreateShowbills < ActiveRecord::Migration
  def change
    create_table :showbills do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
