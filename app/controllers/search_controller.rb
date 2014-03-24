class SearchController < ApplicationController

  def searchfield
  end

  def search
    number = params[:number]

    @patient = Patient.joins(
        "INNER JOIN barcodes ON patients.id = barcodes.patient_id"
    ).where("barcodes.number = ? AND barcodes.expiration >= ?", number, Time.now).first

    respond_to do |format|
      if @patient.nil?
        flash.now[:error] = t :invalid_barcode
        format.html { render action: "searchfield" }
      else
        format.html { redirect_to patient_path(@patient) }
        format.json { render json: @patient }
      end
    end
  end
end
