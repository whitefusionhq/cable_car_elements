require "test_helper"

class CableCarElementsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CableCarElements::VERSION
  end

  def test_elements_output
    cable_car = CableReady::CableCar.instance

    expected_output = <<~HTML
      <cr-op operation="console_log" message="&quot;Super duper!&quot;"></cr-op>
      <cr-op operation="append" html="&quot;\\u003cstrong\\u003eAnd a hearty hello to CableCar!\\u003c/strong\\u003e&quot;" selector="&quot;#root&quot;"></cr-op>
    HTML

    cable_car
      .console_log(message: "Super duper!")
      .append("#root", html: "<strong>And a hearty hello to CableCar!</strong>")
      .elements
      .tap do |output|
        assert_equal expected_output, output
      end
  end
end
