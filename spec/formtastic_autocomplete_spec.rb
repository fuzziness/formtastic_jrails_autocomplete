require File.dirname(__FILE__) + '/test_helper'
require File.expand_path(File.join(File.dirname(__FILE__), '../init.rb'))

class Task
  attr_accessor :id, :status
end

describe "Formtastic" do
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormOptionsHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::ActiveRecordHelper
  include ActionView::Helpers::RecordIdentificationHelper
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::CaptureHelper
  include ActiveSupport
  include ActionController::PolymorphicRoutes

  include Formtastic::SemanticFormHelper

  attr_accessor :output_buffer

  def protect_against_forgery?; false; end

  before do
    @output_buffer = ''
    @task = Task.new

    def task_path(o); "/tasks/1"; end
    def tasks_path; "/tasks"; end
  end

  it "should have included the Fuzzilabs::Formtastic::Autocomplete module" do
    Formtastic::SemanticFormBuilder.included_modules.should include(Fuzzilabs::Formtastic::Autocomplete)
  end

  it "should render an :as => :autocomplete field using autocomplete_plugin" do
    semantic_form_for @task do |builder|
      builder.should_receive('text_field_with_auto_complete').with(:status,
        {:size=>10}, {:required=>true, :limit=>4}).and_return('autocomplete_field')
      concat(
        builder.inputs {
          concat(builder.input(:status, :as=>:autocomplete, :input_html=>{:size=>10}, :limit=>4))
        }
      )
    end
  end

end