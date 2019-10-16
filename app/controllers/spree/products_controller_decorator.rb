# module Spree
#   module StoreControllerDecorator
#     def self.prepend(base)
#       base.before_action :load_taxonomies
#     end

#     def load_taxonomies
#       @taxonomies = Spree::Taxonomy.includes(root: :children)
#     end
#   end
# end

Spree::ProductsController.class_eval do
  before_action :load_taxonomies

  def load_taxonomies
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end
end


# ::Spree::ProductsController.prepend Spree::ProductsControllerDecorator


# class Spree::StoreController
#   before_action :load_taxonomies

#   def load_taxonomies
#     @taxonomies = Spree::Taxonomy.includes(root: :children)
#   end
# end
