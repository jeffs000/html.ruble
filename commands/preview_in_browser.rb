require 'radrails'

command 'Open Document in Internal Browser' do |cmd|
  cmd.scope = 'text.html'
  cmd.output = :show_as_html
  cmd.input = :document
  cmd.invoke {|context| context.in.read }
end