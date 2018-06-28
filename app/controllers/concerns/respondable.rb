module Respondable
  include ActiveSupport::Concern

  delegate :t, to: I18n

  def respond_with_error(error_sym, error_message = "")
    render json:
               {
                   exception: t("respondable.error.#{error_sym.to_s}"),
                   error: error_message
               },
           status: error_sym
  end
end
