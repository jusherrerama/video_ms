class Video < ApplicationRecord
  extend CarrierWave::Mount
  extend CarrierWaveDirect::Mount
  mount_uploader :address, AddressUploader
 categories = %w( others fun scary)
#  enum category: [ :others ,:fun,:scary  ]
  validates :name,  length: { in: 1..50 }, presence: true
  validates :category, presence: true,
            :inclusion => {:in => categories, message: "the valid categories are: #{categories.join ' '}" }
  validates :time, presence: true, numericality: { greater_than: 0.0, less_than_or_equal_to: 10.0, message: "The length of the video should be greater than 0 seconds and less or equal than 10 seconds" }
  validates :user_id, presence: true
  #validates :address, presence: true

  def set_success(format, opts)
   puts "all fine my dog"
  end

  def set_success2 (t)
    self.time = t
  end



end
