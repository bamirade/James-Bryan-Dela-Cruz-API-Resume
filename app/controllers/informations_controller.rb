class InformationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :feedbacks

  def index
    render :index, status: :ok
  end

  def routes
    endpoints = routes_cache

    render json: { endpoints: endpoints }, status: :ok
  end

  def resume
    render json: { name: "James Bryan Dela Cruz", aboutMe: "React & Rails Developer | Freelance Tech Support", contacts: contacts_cache, projects: projects_cache, experience: experience_cache }, status: :ok
  end

  def project
    projects = projects_cache

    render json: { projects: projects }, status: :ok
  end

  def experience
    experiences = experience_cache

    render json: { experiences: experiences }, status: :ok
  end

  def contact_info
    contacts = contacts_cache

    render json: { contact_info: contacts }, status: :ok
  end

  def feedbacks
    feedback = Feedback.new(params.permit(:email, :message))

    if feedback.email.present? || feedback.message.present?
      if feedback.save
        InfoMailer.notify(feedback).deliver_now
        render json: { message: "Feedback sent successfully" }, status: :ok
      else
        render json: { error: feedback.errors.full_messages[0] }, status: :unprocessable_entity
      end
    else
      render json: { error: "Empty email or message" }, status: :unprocessable_entity
    end
  end

  private

  def routes_cache
    Rails.cache.fetch('endpoints_all', expires_in: 1.hour) do
      Endpoint.all.as_json(only: [:description, :url])
    end
  end

  def projects_cache
    Rails.cache.fetch('project_all', expires_in: 1.hour) do
      Project.all.reverse.map do |proj|
        {
          name: proj.name,
          role: proj.role,
          repo: proj.repo,
          live: proj.live,
          description: proj.description,
          features: [
            proj.feature1,
            proj.feature2,
            proj.feature3,
            proj.feature4
          ].compact
        }
      end
    end
  end

  def experience_cache
    Rails.cache.fetch('experience_all', expires_in: 1.hour) do
      Experience.all.reverse.map do |exp|
        {
          title: exp.title,
          company: exp.company,
          start_date: exp.start_date,
          end_date: exp.end_date,
          responsibilities: [
            exp.responsibility1,
            exp.responsibility2,
            exp.responsibility3
          ].compact
        }
      end
    end
  end

  def contacts_cache
    Rails.cache.fetch('contacts_all', expires_in: 1.hour) do
      Contact.all.as_json(only: [:email, :phone, :gitHub, :linkedIn])
    end
  end

  def set_cache_headers
    expires_in 1.hour, public: true
  end
end
