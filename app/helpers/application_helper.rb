module ApplicationHelper
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
end
