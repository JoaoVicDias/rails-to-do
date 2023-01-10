# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 4, maximum: 20 }
  validates :content, presence: true, length: { minimum: 4, maximum: 140 }

  belongs_to :user
end
