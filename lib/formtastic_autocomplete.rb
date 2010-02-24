module Fuzzilabs
  module Formtastic
    module Autocomplete
      
      protected

      def autocomplete_input(method, options)
        html_options = options.delete(:input_html) || {}
        html_options = default_string_options(method, :string).merge(html_options)

        self.label(method, options_for_label(options)) <<
          self.send(:text_field_with_auto_complete, method, html_options, options)
      end

    end
  end
end