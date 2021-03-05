class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :set_lesson, only: [:new]

  def index
    #@users = User.all.order(created_at: :desc)

    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def new
    @account = Account.new
    @user = User.new
    @client = Client.new
    @booking = Booking.new
    @lesson_payment = LessonPayment.new
    @schedules = Schedule.where('start >= ? and start <=  ?', Date.today + 1.day, Date.today + 2.weeks).where(title: 'Available').order('start ASC').all
  end

  def create
    # I have not included the code for "create_client_charge" because you need to figure out how you will process the charge. I have left this here though because I wanted to show that I try to charge the user first because if the charge fails, I don't want anything else created.
    # create_client_charge
    create_client_account
    @user = User.new(user_params)
    @user.account_id = @account.id

    respond_to do |format|
      if @user.save
        create_client_profile
        create_client_bexitooking
        create_client_lesson_payment
        auto_login(@user)
        UserMailer.new_signup_booking_admin(@user, @booking).deliver_later
        UserMailer.new_signup_booking_client(@user, @booking).deliver_later
        format.html { redirect_to dashboard_url, notice: 'Your account was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_back fallback_location: root_path, alert: 'An error occurred while sending this request.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    authorize @user
  end

  def show
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to users_path, notice: 'User roles were successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :time_zone, {role_ids: []})
  end

  def set_lesson
      @lesson = Lesson.find(params[:lesson_id])
  end

  def create_client_account
      @account = Account.new()
      @account.status = 'active'
      @account.account = 'prefix-' + SecureRandom.hex(4)
      @account.account_type = 'client'
      @account.save
  end

  def create_client_profile
      @client = Client.new()
      @client.firstname = params[:user][:client][:firstname]
      @client.lastname = params[:user][:client][:lastname]
      @client.phone = params[:user][:client][:phone]
      @client.user_id = @user.id
      @client.account_id = @user.account_id
      @client.save
    end

    def create_client_booking
      @lesson = Lesson.find(params[:user][:booking][:lesson_id])
      @booking = Booking.new()
      @booking.lesson_id = params[:user][:booking][:lesson_id]
      @booking.schedule_id = params[:user][:booking][:schedule_id]
      @booking.client_id = @client.id
      @booking.account_id = @user.account_id
      @booking.title = @lesson.title
      @booking.cost = @lesson.cost
      @booking.status = 'Booked'
      @booking.save
      @schedule = Schedule.find(params[:user][:booking][:schedule_id])
      @booking.trainer_id = @schedule.trainer_id
      @booking.start = @schedule.start
      @booking.refunded = 0
      @booking.save
      @schedule.title = 'Booked'
      @schedule.save
    end
   def create_client_lesson_payment
      @lesson_payment = LessonPayment.new()
      @lesson_payment.status = 'Paid'
      @lesson_payment.date = Date.today
      @lesson_payment.cost = @lesson.cost
      @lesson_payment.service = @lesson.title
      @lesson_payment.booking_id = @booking.id
      @lesson_payment.account_id = @user.account_id
      @lesson_payment.save
    end

end
