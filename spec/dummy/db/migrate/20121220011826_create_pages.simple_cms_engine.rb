# This migration comes from simple_cms_engine (originally 20121216194550)
class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.timestamps
      t.string :slug
    end
    Page.create_translation_table! title: :string, body: :text, slug: :string
  end

  def down
    drop_table :pages
    Page.drop_translation_table!
  end
end