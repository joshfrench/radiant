class AddPageMetaSubclasses < ActiveRecord::Migration
  def self.up
    add_column :page_meta, :page_meta_type, :string
    add_column :page_meta, :boolean_content, :boolean
    add_column :page_meta, :datetime_content, :datetime
    add_column :page_meta, :integer_content, :integer
    add_index  :page_meta, :boolean_content
    add_index  :page_meta, :datetime_content
    add_index  :page_meta, :integer_content
  end

  def self.down
    remove_index  :page_meta, :integer_content
    remove_index  :page_meta, :datetime_content
    remove_index  :page_meta, :boolean_content
    remove_column :page_meta, :integer_content
    remove_column :page_meta, :datetime_content
    remove_column :page_meta, :boolean_content
    remove_column :page_meta, :page_meta_type
  end
end
