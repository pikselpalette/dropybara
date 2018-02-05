module Capybara
  class Session
    define_method 'drop_file' do |*args, &block|
      current_scope.send('drop_file', *args, &block)
    end
  end

  module Node
    module Actions
      def drop_file(locator, *args)
        element_id = "dropybara_input_#{rand(1000)}"

        driver.execute_script <<-JS
          var input = document.createElement('input');
          input.setAttribute('type', 'file');
          input.setAttribute('id', '#{element_id}')
          document.body.appendChild(input);
        JS

        attach_file(element_id, *args).tap do
          driver.execute_script <<-JS
            var input = document.getElementById('#{element_id}');
            var target = document.querySelector('#{locator}');
            var event = new CustomEvent('drop', {
              target: target,
              dataTransfer: {
                files: input.files
              }
            });
            target.dispatchEvent(event);
            document.body.removeChild(input);
          JS
        end
      end
    end
  end
end
