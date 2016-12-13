class AddTitle < ActiveRecord::Migration
  def change
    add_column :goals, :title, :string
    add_column :goals, :status, :string
    add_column :goals, :private, :boolean
  end
end
