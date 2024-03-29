require 'active_record'

ActiveRecord::Base.establish_connection(:adapter => :dummy)

module DummyRecord
  class Factory < ::ActiveRecord::Base
    def build(options = {})
      options.each_pair { |key, value|
        instance_variable_set("@#{key}", value)
        self.class.send(:attr_accessor, key)
      }
    end

    def self.build_multi(object, count)
      objects = []
      count.times do |c|
        objects << object.stub({id: (c + 1)})
      end
      objects
    end

    def self.find(*args)
      self
    end

    def self.all(*args)
      []
    end

    def self.columns
      @columns ||= [];
    end

    def save(validate = true)
      validate ? valid? : true
    end
  end
end
