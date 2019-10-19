# # Spree::StoreController.class_eval do
# #   before_action :load_taxonomies

# #   def load_taxonomies
# #     @taxonomies = Spree::Taxonomy.includes(root: :children)
# #   end
# # end

# class Spree::StoreController
#   prepend_before_action :load_taxonomies

#   def load_taxonomies
#     @taxonomies = Spree::Taxonomy.includes(root: :children)
#   end
# end
# # module Spree
# #   StoreController.class_eval <<-CODE, __FILE__, __LINE__ + 1
# #   prepend_before_action :load_taxonomies

# #   def load_taxonomies
# #     @taxonomies = Spree::Taxonomy.includes(root: :children)
# #   end

# #   CODE
# # end


# # #needed @taxonomies, unable to inherent fron store controller
# # class Spree::ProductsController
# #   prepend_before_action :load_taxonomies

# #   def load_taxonomies
# #     @taxonomies = Spree::Taxonomy.includes(root: :children)
# #   end
# # end

module Spree
  module StoreControllerDecorator
    def self.prepended(base)
        base.before_action :load_taxonomies
      end

    private

    def load_taxonomies
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end

  end
end

Spree::StoreController.prepend Spree::StoreControllerDecorator
