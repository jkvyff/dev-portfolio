class Project < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.ror
    where(subtitle: 'Ruby on Rails')
  end

  scope :ruby_on_rails_project_items, -> { where(subtitle: 'Ruby on Rails') }
end
