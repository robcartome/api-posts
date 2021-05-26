# frozen_string_literal: true

class Post < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
