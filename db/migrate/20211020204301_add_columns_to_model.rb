class AddColumnsToModel < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :digest, :string, default: "weekly"
    add_column :news, :number_of_editions, :integer, default: 0
  end
end
