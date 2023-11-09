class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :titulo
      t.text :corpo

      t.timestamps
    end
  end
end
