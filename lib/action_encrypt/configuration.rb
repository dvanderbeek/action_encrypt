# frozen_string_literal: true

module ActionEncrypt
  class Configuration
    attr_accessor :key_encryption_key, :blind_index_key

    def initialize(key_encryption_key: nil, blind_index_key: nil)
      @key_encryption_key = key_encryption_key.presence || default_key_encryption_key
      @blind_index_key = blind_index_key.presence || default_blind_index_key
    end

    private

    def default_key_encryption_key
      Rails.application.credentials.key_encryption_key
    end

    def default_blind_index_key
      Rails.application.credentials.blind_index_key
    end
  end
end
