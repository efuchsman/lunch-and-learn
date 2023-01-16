class Api::V1::LearningResourcesController < ApplicationController

  def show
    country = params[:country]

    if country.present?
      video = VideoFacade.country_video(country)
      images = ImageFacade.country_images(country)
      learning_resource = LearningResource.new(country, video, images)
      render json: LearningResourceSerializer.new(learning_resource)
    end

  end
end
