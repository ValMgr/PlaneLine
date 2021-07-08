class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.all.where(user_id:current_user.id)
    @user = current_user
  end

  def reserver
    type_classe = params[:type_classe]
    nombre_passagers = params[:places]

    @vol = Vol.find_by(id:params[:id])
    @reservation = Reservation.create(user_id:current_user.id,vol_id:params[:id],classe:type_classe,nombre_places:nombre_passagers,pnr:SecureRandom.hex(3), heure_reservation:DateTime.now)

    reservation_vol = Reservation.all.where(vol_id:params[:id])
    places_prises_business = 0
    places_prises_economie = 0

    reservation_vol.each do |reservation|
        if reservation.classe == 'economie'
          places_prises_economie+= reservation.nombre_places
        else
          places_prises_business+= reservation.nombre_places
        end
    end

    if ((@vol.economy_class_seats - places_prises_economie) < nombre_passagers.to_i && type_classe == 'economie') || ((@vol.business_class_seats - places_prises_business) < nombre_passagers.to_i && type_classe == 'business')
      flash[:alert]="Erreur en votre faveur"
      redirect_to controller: 'vols', action: 'show', id: params[:id]
    else
      if @reservation.save
        UserMailer.with(reservation: @reservation,user: current_user,vol:@vol).welcome_email.deliver_later
        redirect_to '/'
      end
    end
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:id, :numeroVol, :idUser, :heureReservation, :classe, :nombrePlaces)
    end
end
