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
end
