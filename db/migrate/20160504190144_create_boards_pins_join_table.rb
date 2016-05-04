class CreateBoardsPinsJoinTable < ActiveRecord::Migration
	def change
		create_table :boards_pins, id: false do |t|
			t.integer :board_id
			t.integer :pin_id
		end
	end
end
