require 'know_more/configuration'

module KnowMore
  module Base
    class << self
      def included(base)
        base.extend ClassMethods

        # set default values
        base.config.pages = 3
      end
    end

    module ClassMethods
      def config
        Configuration.instance
      end
      def configure
        return unless block_given?
        yield Configuration.instance
      end
    end
  end
end
