# Controller concern providing an easy way to handle API error responses
module Respondable
  include ActiveSupport::Concern

  delegate :t, to: I18n

  def respond_with_error(error_sym, error_message = '')
    render json:
               {
                 exception: t("respondable.error.#{error_sym}"),
                 error: error_message
               },
           status: error_sym
  end
end
