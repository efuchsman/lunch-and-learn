class Api::V1::LearningResourcesController < ApplicationController

  def show
    country = params[:country]

    if country.present?
      video = VideoFacade.country_video(country)
      images = ImageFacade.country_images(country)
      learning_resource = LearningResource.new(country, video, images)
      if learning_resource.video.nil? && learning_resource.images.blank?
        render json: { error: "Please Check That The Country Provided Is A Real Country" }, status: 404
      else
      render json: LearningResourceSerializer.new(learning_resource)
      end
    else
      render json: { error: "Please Provide A Country Parameter" }, status: 400
    end
  end
end
