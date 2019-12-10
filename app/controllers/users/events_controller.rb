class Users::EventsController < Users::ApplicationController
  before_action :only_user
  before_action :set_event, only: %i[show edit update destroy]

  def create
    @event = current_user.events.create(event_params)
    flash[:success] = '予定を追加しました'
    redirect_to events_path
  end

  def destroy
    @event.destroy
    flash[:success] = '予定を削除しました'
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.unscoped.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :start_time)
  end
end
