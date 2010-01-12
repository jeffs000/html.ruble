require 'radrails'
require 'radrails/ui'

command 'Insert Entity...' do |cmd|
  cmd.key_binding = 'M1+M2+7'
  cmd.scope = 'text.html'
  cmd.output = :insert_as_text
  cmd.input = :none
  cmd.invoke do |context|    
    entities = []
    File.read("#{ENV['TM_BUNDLE_SUPPORT']}/entities.txt").scan(/^(\d+)\t(.+)$/) do |key, value|
      char = [key.to_i].pack('U')
      entities << { 'display' => "#{value} (#{char})", 'char' => char, 'entity' => value }
    end
    
    result = RadRails::UI.menu(entities)
    "&#{result['entity']};"
  end
end
