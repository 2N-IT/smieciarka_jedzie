# frozen_string_literal: true

class Forms::FileComponent < BaseViewComponent
  attr_reader :form, :method
  def initialize(form:, method:)
    @form = form
    @method = method
  end

end
