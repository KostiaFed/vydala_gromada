class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[callback callback_page]

  def create
    @book = Book.find(params[:book_id])
    @payment = @book.payments.new(
      amount: params[:amount].to_i * 100,
      currency: 'UAH',
      status: 'pending',
      order_id: SecureRandom.hex(10)
    )

    if @payment.valid?
      @payment.save

      payment_data = {
        order_id: @payment.order_id,
        merchant_id: ENV['FONDY_MERCHANT_ID'],
        order_desc: "Donation for #{@book.name}",
        amount: @payment.amount,
        currency: @payment.currency,
        response_url: callback_page_payments_url,
        server_callback_url: callback_payments_url
      }

      signature = generate_signature(payment_data)

      render json: {
        url: 'https://pay.fondy.eu/api/checkout/redirect/',
        params: payment_data.merge(signature:)
      }
    else
      redirect_to @book
    end
  end

  def callback
    data = params[:order_id] && Payment.find_by(order_id: params[:order_id])

    if data && valid_signature?(params)
      data.update(status: params[:order_status], response: params.to_unsafe_h)
      head :ok
    else
      head :bad_request
    end
  end

  def callback_page
    redirect_to callback_success_payments_url
  end

  def callback_success; end

  private

  def generate_signature(data)
    sorted = data.sort.to_h
    string = [ENV['FONDY_SECRET_KEY']] + sorted.values
    Digest::SHA1.hexdigest(string.join('|'))
  end

  def valid_signature?(params)
    data = params.except(:signature).to_unsafe_h
    generate_signature(data) == params[:signature]
  end
end
