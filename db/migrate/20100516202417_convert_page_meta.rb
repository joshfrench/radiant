class ConvertPageMeta < ActiveRecord::Migration
  def self.up
    Page.all.each do |page|
      page.metas.create(:name => 'Keywords', :content => page.keywords) if page.keywords.present?
      page.metas.create(:name => 'Description', :content => page.description) if page.description.present?
    end
    remove_column :pages, :keywords
    remove_column :pages, :description
  end

  def self.down
    add_column :pages, :description, :string
    add_column :pages, :keywords, :string
  end
end
