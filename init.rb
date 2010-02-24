if Object.const_defined?("Formtastic")
  require 'formtastic_autocomplete'
  Formtastic::SemanticFormBuilder.send(:include, Fuzzilabs::Formtastic::Autocomplete)
end
