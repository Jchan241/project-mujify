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
        text = mdi_tag('cart-outline 36px', class: 'empty-cart')
        css_class = 'empty'
      else
        # text = '<i class="mi face"></i>'
        text = mdi_tag('cart-outline 36px', class: 'full-cart')
        css_class = 'full'

        # text = "<span class='fas fa-shopping-bag'></span> #{text}: (#{simple_current_order.item_count})
        #         <span class='amount'>#{simple_current_order.display_total.to_html}</span>"
        # css_class = 'full'
      end

      link_to(spree.cart_path) do
        content_tag(:div, class: "cart-info nav-link #{css_class}") do
          text.html_safe +
          if simple_current_order.item_count > 0
            content_tag(:div, simple_current_order.item_count, class: "cart_count")
          end
        end
      end
        # content_tag :div, simple_current_order.item_count

      # link_to text.html_safe, spree.cart_path, class: "cart-info nav-link #{css_class}"
      # content_tag(:div, simple_current_order.item_count.to_s, class: ["cart_count"])
    end
end


# +
#           content_tag(:div, simple_current_order.item_count, class: "cart_count")
