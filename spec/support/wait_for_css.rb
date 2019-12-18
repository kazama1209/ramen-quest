module WaitForCss
  def wait_for_css_appear(selector, wait_time = Capybara.default_max_wait_time)
    Timeout.timeout(wait_time) do
      loop until has_css?(selector)
    end
    yield if block_given?
  end

  def wait_for_css_disappear(selector, wait_time = Capybara.default_max_wait_time)
    Timeout.timeout(wait_time) do
      loop until has_no_css?(selector)
    end
    yield if block_given?
  end
end

RSpec.configure do |config|
  config.include WaitForCss, type: :system
end