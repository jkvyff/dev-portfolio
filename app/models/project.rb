class Project < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attr| attr["name"].blank? }

  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.ror
    where(subtitle: 'Ruby on Rails')
  end

  scope :ruby_on_rails_project_items, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
