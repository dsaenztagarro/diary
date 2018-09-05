# frozen_string_literal: true

class Exercise < ApplicationRecord
  belongs_to :workout
  belongs_to :planned_exercise
  has_many :metadatums
  delegate :name, to: :planned_exercise
  validates_numericality_of :order, only_integer: true
  accepts_nested_attributes_for :metadatums
end
