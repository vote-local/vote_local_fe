# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'z8C8OPOi1sRHGQk6SqwmaC9cw', 'rPUx0xukbKiZc3ogvjZ8U9qB42Nd6FEnADDnD3fxdYIKfRlty7'
end
