class CreateNewsWithAccs < ActiveRecord::Migration[6.1]
  def change
    create_table :news_with_accs do |t|
      t.integer :id_news
      t.integer :id_acc

      t.timestamps
    end
  end
end
