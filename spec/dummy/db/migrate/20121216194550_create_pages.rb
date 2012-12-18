class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.string :path
      t.timestamps
    end
    Page.create_translation_table! title: :string, body: :text
  end

  def down
    drop_table :pages
    Page.drop_translation_table!
  end
end
