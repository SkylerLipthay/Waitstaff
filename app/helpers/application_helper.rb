module ApplicationHelper
  def page_entries_info(collection, options = {})
    entry_name = options[:entry_name] || (collection.empty?? 'item' :
      collection.first.class.name.split('::').last.titleize)
    if collection.total_pages < 2
      case collection.size
      when 0; "No #{entry_name.pluralize.downcase} found"
      when 1; "Displaying the only 1 #{entry_name.downcase}"
      else; "Displaying all #{collection.size} #{entry_name.pluralize.downcase}"
      end
    else
      %{Displaying %d - %d of %d #{entry_name.pluralize.downcase}} % [
        collection.offset + 1,
        collection.offset + collection.length,
        collection.total_entries
      ]
    end
  end

  def svg_tag(image_name, alt_text, options = {})
    png_options = options.merge({
      alt: alt_text,
      title: alt_text,
      class: '-no-svg'
    }) do |key, oldval, newval|
      "#{oldval} #{newval}"
    end

    svg_options = options.merge({
      alt: alt_text,
      title: alt_text,
      style: 'display: none;',
      class: '-svg'
    }) do |key, oldval, newval|
      "#{oldval} #{newval}"
    end

    return image_tag("#{image_name}.png", png_options) + 
           image_tag("#{image_name}.svg", svg_options)
  end

  def current_controller?(controller, actions = nil)
    return false if controller != params[:controller]
    return true if actions.nil?
    
    if actions.kind_of? String
      return actions == params[:action]
    elsif actions.kind_of? Array
      return actions.include? params[:action]
    end

    false
  end

  def page_title
    t(page_title_translation_key, default: :"pages.index.title")
  end

  def page_title_translation_key
    if action_name == 'create'
      action = 'new'
    elsif action_name == 'update'
      action = 'edit'
    else
      action = action_name
    end
    
    :"#{controller_name}.#{action}.title"
  end
end
