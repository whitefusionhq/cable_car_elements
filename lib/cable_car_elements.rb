require "cable_car_elements/version"
require "cable_ready"

module CableCarElements
end

CableReady::CableCar.class_eval do
  def elements(clear: true)
    payload = operations_custom_elements
    reset! if clear
    payload
  end

  def operations_custom_elements
    operations = @enqueued_operations.select { |_, list| list.present? }
    operations.map do |name, operation|
      operation.map do |enqueued_operation|
        attrs = enqueued_operation.map do |key, val|
          %(#{key.dasherize}="#{CGI.escapeHTML(val.to_json)}")
        end.join(" ")

        <<~HTML
          <cr-op operation="#{name}" #{attrs}></cr-op>
        HTML
      end
    end.flatten.join
  end
end
