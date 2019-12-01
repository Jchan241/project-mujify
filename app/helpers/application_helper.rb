module ApplicationHelper
  def nav_tree(root_taxon, current_taxon, max_level = 1)
    return '' if max_level < 1 || root_taxon.leaf?

    content_tag :div, class: 'dropdown-menu', 'aria-labelledby' => 'navbarDropdown' do
      taxons = root_taxon.children.map do |taxon|
        css_class = current_taxon&.self_and_ancestors&.include?(taxon) ? 'dropdown-item active' : 'dropdown-item'
        link_to(taxon.name, seo_url(taxon), class: css_class) + taxons_tree(taxon, current_taxon, max_level - 1)
      end
      safe_join(taxons, "\n")
    end
  end

  def link_to_carts(text = nil)
      text = text ? h(text) : Spree.t('cart')
      css_class = nil

      if simple_current_order.nil? || simple_current_order.item_count.zero?
        text = fa_icon 'shopping-cart'
        css_class = 'empty'
      else
        text = fa_icon 'shopping-cart', class: 'full-bag'
        css_class = 'full'

        # text = "<span class='fas fa-shopping-bag'></span> #{text}: (#{simple_current_order.item_count})
        #         <span class='amount'>#{simple_current_order.display_total.to_html}</span>"
        # css_class = 'full'
      end

      link_to text.html_safe, spree.cart_path, class: "cart-info nav-link #{css_class}"
    end
end
