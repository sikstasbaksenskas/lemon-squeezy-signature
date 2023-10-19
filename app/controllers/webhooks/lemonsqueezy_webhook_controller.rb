module Webhooks
  class LemonsqueezyWebhookController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :webhook

    def webhook
      @signature = request.headers['X-Signature']
      @payload_to_verify = request.body.read

      render json: { signature_valid: signature_valid? }
    end

    private

    attr_reader :signature, :payload_to_verify

    def signature_valid?
      secret = '[SIGNING_SECRET]'

      return ActiveSupport::SecurityUtils::secure_compare(
        OpenSSL::HMAC.hexdigest('sha256', secret, payload_to_verify), signature)
    end
  end
end
