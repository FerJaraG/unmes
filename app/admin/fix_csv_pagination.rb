# Workaround for until https://github.com/gregbell/active_admin/issues/2847 is resolved
module ActiveAdmin
  class ResourceController < BaseController
    module DataAccess
      alias original_apply_pagination apply_pagination
      def apply_pagination(chain)
        request.format == 'text/csv' ? chain.limit(10000) : original_apply_pagination(chain)
      end
    end
  end
end