require 'active_record/relation/query_methods'

module ActiveRecord
  module QueryMethods
    module ArelExtensionHandler

      def build_arel
        arel = super
        build_with(arel)
        build_rank(arel, rank_value) if rank_value

        arel
      end
    end
  end
end

ActiveRecord::QueryMethods.send(:prepend, ActiveRecord::QueryMethods::ArelExtensionHandler)
