class Gallery < ActiveRecord::Base
  belongs_to :user
  has_many :fotos
  
  def first_thumb
    return 'empty' if fotos.empty?
	fotos.find(:first).thumb_tag
  end
end
