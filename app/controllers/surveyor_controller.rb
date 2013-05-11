# Surveyor Controller allows a user to take a survey. It is semi-RESTful since it does not have a concrete representation model.
# The "resource" is a survey attempt/session populating a response set.
class SurveyorController < ApplicationController
  unloadable
  include Surveyor::SurveyorControllerMethods

  layout 'application'

  # where to send the user once the survey has been completed
  # if there was a dataset, go back to it
  def surveyor_finish
    if @response_set.dataset
      dataset_path @response_set.dataset
    else
      surveyor.available_surveys_path
    end
  end
end