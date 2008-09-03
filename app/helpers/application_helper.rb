# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def is_admin?
    !current_user.nil? && current_user.level == 1
  end
  
  def add_to_head(filename)
    content_for(:head) do
   	 File.open("#{RAILS_ROOT}/#{filename}").read
	end
  end
  
  def add_javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
 
  def add_stylesheet(*files)
    content_for(:head) { stylesheet_link_tag(*files) }
  end

end
