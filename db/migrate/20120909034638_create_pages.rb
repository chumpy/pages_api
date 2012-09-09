class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, unique: true, null: false
      t.text :content, null: false
      t.datetime :published_on
      t.timestamps
    end
    add_index :pages, :published_on, order: {name: :desc}
  end

end
