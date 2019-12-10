class ApplicationController < ActionController::Base
  rescue_from Exception, with: :render_500 unless Rails.env.development?
  rescue_from ActionController::RoutingError, with: :render_404 unless Rails.env.development?
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404
    render template: '/users/errors/404', status: :not_found, layout: 'users'
  end

  def render_500(error)
    return if error.class == ActiveRecord::RecordInvalid

    Rails.logger.error(error)
    Rails.logger.error(error.backtrace.join("\n"))

    ExceptionNotifier.notify_exception(error, env: request.env, data: { message: error })
    render template: '/users/errors/500', status: :internal_server_error, layout: 'users'
  end
end
