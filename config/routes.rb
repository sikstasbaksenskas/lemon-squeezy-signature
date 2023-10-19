Rails.application.routes.draw do
  match "/lemonsqueezy_webhook", to: 'webhooks/lemonsqueezy_webhook#webhook', via: :post
end
