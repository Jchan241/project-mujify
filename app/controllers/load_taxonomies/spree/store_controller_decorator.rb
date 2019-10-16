module LoadTaxonomies
  module Spree
    module StoreControllerDecorator
      def load_taxonomies
        @taxonomies = Spree::Taxonomy.includes(root: :children)
      end
    end
  end
end

Spree::StoreController.prepend LoadTaxonomies::Spree::StoreControllerDecorator
