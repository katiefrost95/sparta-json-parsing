require 'json'

json = File.read('json_example.json')

#Taking json and creating a hash of it
json_parse = JSON.parse(json)

p json_parse['colors'].first
