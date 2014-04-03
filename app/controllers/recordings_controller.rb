class RecordingsController < ApplicationController
  def create
    Recording.create(recording_params)
    redirect_to dashboard_path
  end

  private

  def recording_params
    params.
      require(:recording).
      permit(:start_at, :end_at).
      merge(user: current_user)
  end
end
