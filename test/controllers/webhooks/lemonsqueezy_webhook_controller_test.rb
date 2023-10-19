require "test_helper"

module Webhooks
  class LemonsqueezyWebhookControllerTest < ActionDispatch::IntegrationTest
    def setup
      @secret = '[SIGNING_SECRET]'
      @payload_to_verify = '[PAYLOAD_TO_VERIFY]'
    end

    test "`false` is being returned if signature is invalid" do
      @invalid_signature = "b97b6109d5283b4785f25976ab338d0f"

      headers = { 'X-Signature' =>  @invalid_signature }

      post lemonsqueezy_webhook_path, env: { "RAW_POST_DATA" => @payload_to_verify }, headers: headers

      response_body = JSON.parse(response.body)

      assert_equal(false, response_body.dig('signature_valid'))
    end

    test "`true` is being returned if signature is valid" do
      valid_signature = OpenSSL::HMAC.hexdigest('sha256', @secret, @payload_to_verify)

      headers = { 'X-Signature' =>  valid_signature }

      post lemonsqueezy_webhook_path, env: { "RAW_POST_DATA" => @payload_to_verify }, headers: headers

      response_body = JSON.parse(response.body)

      assert_equal(true, response_body.dig('signature_valid'))
    end
  end
end
