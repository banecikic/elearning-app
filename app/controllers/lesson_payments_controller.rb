class LessonPaymentsController < ApplicationController
  before_action :set_lesson_payment, only: %i[ show edit update destroy ]

  # GET /lesson_payments or /lesson_payments.json
  def index
    @lesson_payments = LessonPayment.all
  end

  # GET /lesson_payments/1 or /lesson_payments/1.json
  def show
  end

  # GET /lesson_payments/new
  def new
    @lesson_payment = LessonPayment.new
  end

  # GET /lesson_payments/1/edit
  def edit
  end

  # POST /lesson_payments or /lesson_payments.json
  def create
    @lesson_payment = LessonPayment.new(lesson_payment_params)

    respond_to do |format|
      if @lesson_payment.save
        format.html { redirect_to @lesson_payment, notice: "Lesson payment was successfully created." }
        format.json { render :show, status: :created, location: @lesson_payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_payments/1 or /lesson_payments/1.json
  def update
    respond_to do |format|
      if @lesson_payment.update(lesson_payment_params)
        format.html { redirect_to @lesson_payment, notice: "Lesson payment was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson_payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_payments/1 or /lesson_payments/1.json
  def destroy
    @lesson_payment.destroy
    respond_to do |format|
      format.html { redirect_to lesson_payments_url, notice: "Lesson payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_payment
      @lesson_payment = LessonPayment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_payment_params
      params.require(:lesson_payment).permit(:payment_number, :status, :date, :cost, :service, :booking_id, :account_id)
    end
end
