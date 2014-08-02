class JosephMemo < ActiveRecord::Base
  has_attached_file :imgs
  # do_not_validate_attachment_file_type :imgs
  validates_attachment :imgs, content_type: { content_type: ["application/zip"] }
  validates :name, presence: true
  validates :title, presence: true
  validates :words, presence: true
end
