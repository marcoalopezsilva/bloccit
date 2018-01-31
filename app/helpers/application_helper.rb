module ApplicationHelper
    #We define a method named 'form_group_tag' which takes two arguments: array of errors, and a block.
    def form_group_tag(errors, &block)
      css_class = 'form-group'
      css_class << ' has-error' if errors.any?
      #The content_tag takes a symbol argument, a block, and an options hash.
      #It then creates the symbol-specified HTML tag with the block contents, and if specified, the options.
      content_tag :div, capture(&block), class: css_class
     end

end
