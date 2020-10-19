class Project < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attr| attr["name"].blank? }

  validates_presence_of :title, :body, :main_image, :thumb_image

  mount_uploader :main_image, ProjectUploader
  mount_uploader :thumb_image, ProjectUploader

  def self.ror
    where(subtitle: 'Ruby on Rails')
  end

  def self.by_position
    order("position ASC")
  end

  scope :ruby_on_rails_project_items, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  acts_as_list

end
