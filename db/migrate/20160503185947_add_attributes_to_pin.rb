class AddAttributesToPin < ActiveRecord::Migration
  def change
    add_column :pins, :title, :string
    add_column :pins, :description, :text
  end
end
