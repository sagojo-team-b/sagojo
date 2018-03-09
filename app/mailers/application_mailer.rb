# rubocop:disable Style/MethodMissing

class ApplicationMailer < ActionMailer::Base
  # Heroku web apps do not access worker's filesystem
  # https://github.com/fgrehm/letter_opener_web#usage-on-heroku

  # override
  def self.method_missing(method_name, *args)
    if action_methods.include?(method_name.to_s)
      MyMessageDelivery.new(self, method_name, *args)
    else
      super
    end
  end

  class MyMessageDelivery < ActionMailer::MessageDelivery
    # override
    def deliver_later!
      if Rails.env.heroku_review_app?
        deliver_now!
      else
        super
      end
    end

    # override
    def deliver_later
      if Rails.env.heroku_review_app?
        deliver_now
      else
        super
      end
    end
  end
end
