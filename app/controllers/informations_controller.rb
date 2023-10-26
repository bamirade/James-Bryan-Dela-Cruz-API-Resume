class InformationsController < ApplicationController
  def index
    render :index
  end

  def routes
    render json: { routes: ""}
  end

  def resume

  end

  def projects

  end

  def expirience

  end

  def contact_info

  end

  def feedbacks

  end

  private

  def feedback_params
    params.require(:feedback).permit(:first_name, :last_name, :email, :comment)
  end
end
