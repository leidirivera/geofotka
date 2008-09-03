class DataFile < ActiveRecord::Base
  def self.save(upload)
    name =  upload['datafile'].original_filename
    directory = "public/imagelib"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
  
  def self.destroy(filename)
    File.delete("#{RAILS_ROOT}/public/imagelib/#{filename}") \
      if File.exist?("#{RAILS_ROOT}/public/imagelib/#{filename}")
  end
 

end