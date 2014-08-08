module Rspec
  module QueryLimit
    RSpec::Matchers.define :query_limit_eq do |expected|

      match do |block|
        query_count(&block) == expected
      end

      if self.respond_to?(:failure_message)
        failure_message do |actual|
          failure_text
        end

        failure_message_when_negated  do |actual|
          failure_text_negated
        end
      else
        failure_message_for_should do |actual|
          failure_text
        end

        failure_message_for_should_not do |actual|
          failure_text_negated
        end
      end

      def query_count(&block)
        @counter = ActiveRecord::QueryCounter.new
        ActiveSupport::Notifications.subscribed(@counter.to_proc, 'sql.active_record', &block)
        @counter.query_count
      end

      def supports_block_expectations?
        true
      end

      def failure_text
        "Expected to run exactly #{expected} queries, got #{@counter.query_count}"
      end

      def failure_text_negated
        "Expected to run other than #{expected} queries, got #{@counter.query_count}"
      end
    end
  end
end
