# -*- coding: utf-8 -*-

module PryPipeline
  class Response
    def initialize(response)
      @response = response
    end

    def to_s
      case @response
      when Hash
        h = @response.to_hash
        h.keys.map { |key| "#{key} #{h[key]}" }.join("\n")
      when Array
        @response.to_a.join("\n")
      when String, Symbol
        @response.to_s
      else
        @response
      end
    end
  end
end
