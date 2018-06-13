module Respondable
  include ActiveSupport::Concern

  delegate :t, to: I18n

  def respond_with_error(error_sym)
    render json: { error: t("respondable.error.#{error_sym.to_s}") }, status: error_sym
  end
end
