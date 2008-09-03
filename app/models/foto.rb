class Foto < ActiveRecord::Base
  belongs_to :gallery
  

  
  #def thumb
  #  "/thumb/#{file_path}?w=400&h=350"
  #end
  def thumb
    "/thumb/#{file_path}?w=400&h=350"
  end
  
  def path
    File.join('/imagelib',file_path)
  end
  
  def thumb_tag
    "<img src=\"#{self.path}\" width=\"144\"/>"
  end
  
  def middle_thumb_tag
    "<img src=\"#{self.path}\" width=\"244\"/>"
  end

end
