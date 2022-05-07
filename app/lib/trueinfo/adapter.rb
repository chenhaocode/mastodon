# frozen_string_literal: true

class TrueInfo::Adapter < ActiveModelSerializers::Adapter::Attributes
  def self.default_key_transform
    :camel_lower
  end
end