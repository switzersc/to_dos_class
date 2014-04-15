class CreateToDos < ActiveRecord::Migration
  def change
  	create_table :to_dos do |t|
  		t.string :description
  		t.date :due_date
  		t.timestamps # => created_at updated_at
  	end
  end
end
