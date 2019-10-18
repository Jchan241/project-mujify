require 'spree/base_controller'
require 'spree/store_controller'

Spree::StoreController.class_eval do
  before_action :load_taxonomies

  def load_taxonomies
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end
end

# class Spree::StoreController
#   prepend_before_action :load_taxonomies

#   def load_taxonomies
#     @taxonomies = Spree::Taxonomy.includes(root: :children)
#   end
# end
# module Spree
#   StoreController.class_eval <<-CODE, __FILE__, __LINE__ + 1
#   prepend_before_action :load_taxonomies

#   def load_taxonomies
#     @taxonomies = Spree::Taxonomy.includes(root: :children)
#   end

#   CODE
# end
