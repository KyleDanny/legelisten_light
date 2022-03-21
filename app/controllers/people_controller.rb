require "hpr"
require "pry-byebug"

class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]

  def index   
    @people = Person.search(params[:search])
  end

  def show
    @people = Person.all
    @person_clinic = PersonClinic.new
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
      @person = Person.new(person_params)
      
      if @person.valid?
        response = request_api(@person.hprId)

        if response.class != Hpr::InvalidHprNumberError
          @person.legal_name = response.name
          @person.birth_date = response.birth_date
          
          respond_to do |format|
            if @person.save
              format.html { redirect_to person_url(@person), notice: "Person was successfully created." }
              format.json { render :show, status: :created, location: @person }
            end
          end
        end
      else 
        respond_to do |format|
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @person.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully removed." }
      format.json { head :no_content }
    end
  end

  private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:name, :hprId)
    end

    def request_api(id) 
      begin
        hpr_number = id.to_s
        scraper = Hpr.scraper(hpr_number: hpr_number)
      rescue => error
        error.message
        error
      end
    end

end
