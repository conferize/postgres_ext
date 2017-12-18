require 'active_record/relation/query_methods'

module ActiveRecord
  module QueryMethods
    module ArelExtensionHandler
      def build_arel_with_extensions
        arel = build_arel_without_extensions

        build_with(arel)

        build_rank(arel, rank_value) if rank_value

        arel
      end

      def self.included(base)
        base.class_eval do
          alias_method_chain(:build_arel, :extensions)
        end
      end
    end
  end
end

ActiveRecord::QueryMethods.send(:include, ActiveRecord::QueryMethods::ArelExtensionHandler)
