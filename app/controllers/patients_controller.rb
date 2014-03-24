class PatientsController < ApplicationController
  load_and_authorize_resource

# GET /patients
# GET /patients.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

# GET /patients/1
# GET /patients/1.json
  def show
    @cmi = get_meds_with_illness_conflicts(@patient)
    @cmm = get_meds_with_med_conflicts(@patient)
    @patient.blood_pressures.sort! {|a,b| a.date <=> b.date}

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
      format.js   {

      }
    end
  end

# GET /patients/new
# GET /patients/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

# GET /patients/1/edit
  def edit
  end

# POST /patients
# POST /patients.json
  def create

    respond_to do |format|
      if @patient.save
        flash[:success] = "Patient was successfully created."
        format.html { redirect_to @patient}
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

# PUT /patients/1
# PUT /patients/1.json
  def update
    params[:patient][:illness_ids] ||= []
    params[:patient][:medicament_ids] ||= []
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        flash[:success] = "Patient was successfully updated."
        format.html { redirect_to @patient }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

# DELETE /patients/1
# DELETE /patients/1.json
  def destroy
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end

  private

  def get_meds_with_illness_conflicts(patient)

    Medicament.joins(
        "INNER JOIN medicaments_patients as mp ON mp.medicament_id = medicaments.id AND mp.patient_id = " + Patient.sanitize(patient.id)
    ).where("
        EXISTS (
          SELECT m2.* FROM
            medicaments as m2
          INNER JOIN conflict_illnesses as ci ON ci.medicament_id = m2.id
          INNER JOIN illnesses as i ON ci.illness_id = i.id
          INNER JOIN illnesses_patients as ip ON ip.illness_id = i.id AND ip.patient_id = ?
          WHERE
            medicaments.id = m2.id
        )
    ",
    patient.id
    )


  end

  def get_meds_with_med_conflicts(patient)

    Medicament.joins(
        "INNER JOIN medicaments_patients as mp ON mp.medicament_id = medicaments.id AND mp.patient_id = " + Patient.sanitize(patient.id)
    ).where("
        EXISTS (
          SELECT m2.* FROM
            medicaments as m2
          INNER JOIN conflict_meds as cm ON cm.medicament_id = m2.id
          INNER JOIN medicaments as m3 ON cm.med_id = m3.id
          INNER JOIN medicaments_patients as mp2 ON mp2.medicament_id = m3.id AND mp2.patient_id = ?
          WHERE
            medicaments.id = m2.id
        )
    ",
            patient.id
    )


  end
end
