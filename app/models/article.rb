class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags

  scope :search_by_title, -> (name) { where("title like ?", "%#{name}%")}
  scope :sort_by_desc_created_date, ->{where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight).order(created_at: :desc)}

end

