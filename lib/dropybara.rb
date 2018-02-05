module Capybara
  module Node
    module Actions
      def drop_file(locator, *args)
        ELEMENT_ID = "dropybara_input_#{rand(1000)}"

        execute_script <<-JS
          var input = document.createElement('input');
          input.setAttribute('type', 'file');
          input.setAttribute('id', '#{ELEMENT_ID}')
          document.body.appendChild(input);
        JS

        attach_file(ELEMENT_ID, *args).tap do
          execute_script <<-JS
            var input = document.getElementById('#{ELEMENT_ID}');
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
