# frozen_string_literal: true

class User < ApplicationRecord
  validates_presence_of :provider, :uid

  def self.find_with_omniauth(auth)
    where(provider: auth["provider"], uid: auth["uid"].to_s).first
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth.dig("info", "name") || ""
    end
  end
end
