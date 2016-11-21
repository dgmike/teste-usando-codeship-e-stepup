require 'json'
require 'simplecov'
require "codeclimate-test-reporter"

coverage_dir = "#{ENV['PWD']}/coverage"
filename = '.resultset.json'

# Merge coverage results from other nodes
# .resultset.json is a hidden file and thus ignored by the glob

SimpleCov.start 'rails'
SimpleCov.command_name 'RSpec'
SimpleCov.root "#{ENV['PWD']}"
SimpleCov.coverage_dir "coverage/merged/"

files = Dir.glob(File.join(coverage_dir, "**/#{filename}"))

files.each_with_index do |file, i|
  resultset = JSON.load(File.read(file))
  resultset.each do |command_name, data|
    result = SimpleCov::Result.from_hash(['command', i].join => data)
    SimpleCov::ResultMerger.store_result(result)
  end
end

merged_result = SimpleCov::ResultMerger.merged_result
merged_result.command_name = 'RSpec'

# Format merged result with html
# html_formatter = SimpleCov::Formatter::HTMLFormatter.new
# html_formatter.format(merged_result)

# Post merged coverage result to codeclimate
if ENV['CODECLIMATE_TOKEN']
  ENV['CODECLIMATE_REPO_TOKEN'] = ENV['CODECLIMATE_TOKEN']
  puts 'formatted_results'
  puts formatted_results.to_json
  codeclimate_formatter = CodeClimate::TestReporter::Formatter.new
  puts 'codeclimate_formatter.format'
  formatted_results = codeclimate_formatter.format({'RSpec' => {'coverage' => merged_result.original_result}})
  puts 'post_results.post'
  CodeClimate::TestReporter::PostResults.new(formatted_results).post
end
