# frozen_string_literal: true

class User < ApplicationRecord
  validates_presence_of :provider, :uid

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth.dig("info", "name") || ""
    end
  end
end
