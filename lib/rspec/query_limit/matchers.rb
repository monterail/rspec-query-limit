module Rspec
  module QueryLimit
    RSpec::Matchers.define :query_limit_eq do |expected|

      match do |block|
        query_count(&block) == expected
      end

      failure_message_for_should do |actual|
        "Expected to run exactly #{expected} queries, got #{@counter.query_count}"
      end

      failure_message_for_should_not do |actual|
        "Expected to run other than #{expected} queries, got #{@counter.query_count}"
      end

      def query_count(&block)
        @counter = ActiveRecord::QueryCounter.new
        ActiveSupport::Notifications.subscribed(@counter.to_proc, 'sql.active_record', &block)
        @counter.query_count
      end

      def supports_block_expectations?
        true
      end

    end
  end
end
