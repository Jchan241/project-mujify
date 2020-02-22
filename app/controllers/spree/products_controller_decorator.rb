module Spree
  module ProductsControllerDecorator
  #   def self.prepended(base)
  #       base.before_action :load_taxonomies
  #     end

  #   private

  #   def load_taxonomies
  #     @taxonomies = Spree::Taxonomy.includes(root: :children)
  #   end

  end
end

# Spree::ProductsController.prepend Spree::ProductsControllerDecorator
