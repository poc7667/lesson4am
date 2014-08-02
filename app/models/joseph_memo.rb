class JosephMemo < ActiveRecord::Base
  has_attached_file :imgs
  # do_not_validate_attachment_file_type :imgs
  validates_attachment :imgs, content_type: { content_type: ["application/zip"] }
  validates :name, presence: true
  validates :title, presence: true
  validates :words, presence: true
  before_post_process :transliterate_file_name

  def transliterate_file_name
    extension = File.extname(imgs_file_name).downcase
    self.imgs.instance_write :file_name, "#{Time.now.to_i.to_s}#{extension}"
  end  
end
