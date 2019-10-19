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
