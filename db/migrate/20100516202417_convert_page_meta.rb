class ConvertPageMeta < ActiveRecord::Migration
  def self.up
    Page.all.each do |page|
      page.metas.create(:name => 'Keywords', :content => page.keywords)
      page.metas.create(:name => 'Description', :content => page.description)
    end
    remove_column :pages, :keywords
    remove_column :pages, :description
    Radiant::Config['defaults.page.meta'] ||= 'Keywords, Description'
  end

  def self.down
    add_column :pages, :description, :string
    add_column :pages, :keywords, :string
  end
end
