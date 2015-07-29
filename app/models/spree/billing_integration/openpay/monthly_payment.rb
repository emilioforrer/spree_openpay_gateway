module Spree
  class BillingIntegration::Openpay::MonthlyPayment < Gateway
    preference :auth_token, :string
    preference :merchant_id, :string

    unless Rails::VERSION::MAJOR == 4
      attr_accessible :preferred_auth_token
    end

    def provider_class
      Spree::Openpay::MonthlyPaymentProvider
    end

    def payment_source_class
      CreditCard
    end

    def card?
      true
    end

    def auto_capture?
      false
    end

    def with_installments?
      true
    end

    def method_type
      'conekta_card'
    end
  end
end