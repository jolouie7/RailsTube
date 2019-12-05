class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    mount_uploader :video, FileUploader
    validates :name, presence: true
    validates :description, presence: true
end
