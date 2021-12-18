class PersonnesController < ApplicationController
  before_action :set_personne, only: [:show, :update, :destroy]

  # GET /personnes
  def index
    @personnes = Personne.all

    render json: @personnes
  end

  # GET /personnes/1
  def show
    render json: @personne
  end

  # POST /personnes
  def create
    @personne = Personne.new(personne_params)

    if @personne.save
      render json: @personne, status: :created, location: @personne
    else
      render json: @personne.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /personnes/1
  def update
    if @personne.update(personne_params)
      render json: @personne
    else
      render json: @personne.errors, status: :unprocessable_entity
    end
  end

  # DELETE /personnes/1
  def destroy
    @personne.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personne
      @personne = Personne.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def personne_params
      params.require(:personne).permit(:prenom, :nom)
    end
end
