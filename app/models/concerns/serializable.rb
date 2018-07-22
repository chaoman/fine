# Model concern for serialization
module Serializable
  extend ActiveSupport::Concern

  # Reading the parameters aka injecting the Serializer class
  module ClassMethods
    attr_reader :serializer_class

    private

    def serializable(serializer_class:)
      @serializer_class = serializer_class
    end
  end

  included do
    def serialized(options = {})
      self.class.serializer_class.new(self, params: { options: options })
    end

    def serialized_json(options = {})
      serialized(options).serialized_json
    end

    def as_hash(options = {})
      serialized(options).serializable_hash
    end
  end
end
