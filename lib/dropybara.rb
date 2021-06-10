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
          input.setAttribute('multiple', '');
          document.body.appendChild(input);
        JS

        attach_file(element_id, args).tap do
          driver.execute_script <<-JS
            var input = document.getElementById('#{element_id}');
            var target = document.querySelector('#{locator}');
            var data = new DataTransfer();
            data.files = input.files;
            for (var i = 0; i < input.files.length; i++) {
              data.items.add(input.files[i]);
            }
            data.types = ['Files'];

            var event = new DragEvent('drop', {
              bubbles: true,
              target: target,
              dataTransfer: data
            });
            target.dispatchEvent(event);

            document.body.removeChild(input);
          JS
        end
      end
    end
  end
end
