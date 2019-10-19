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
end
