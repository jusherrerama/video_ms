class Video < ApplicationRecord
  mount_uploader :address, AddressUploader


  def set_success(format, opts)
   puts "poner que el video fue prosesado"
   puts "acsasa"
    puts "acsasa"
 end
 def set_success2
  puts "acsasa poner duracion el video "
     puts "acsasa"
   end
end
