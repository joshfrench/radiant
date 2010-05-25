# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class PageMetaExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://github.com/jfrench/radiant-page_meta-extension"
  
  def activate
    Page.send :include, PageExtensions, MetaTags
    admin.pages.edit.add :popups, 'add_meta_popup'
    admin.page.edit.add :extended_metadata, "page_metas"
  end

end
