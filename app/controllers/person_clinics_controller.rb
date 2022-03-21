class PersonClinicsController < ApplicationController
  
  def new
    @person_clinic = PersonClinic.new
  end

  def create
    @person = Person.find(params[:person_id])
    @person_clinic = @person.person_clinics.new(clinic_params)

    if @person_clinic.save
      flash[:notice] = "Added successfully"
      redirect_to person_path(@person)
    else
      render :_new
    end
  end

  private

  def clinic_params
    params.require(:person_clinic).permit(:clinic_id)
  end
end
