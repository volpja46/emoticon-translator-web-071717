require 'yaml'
require 'pry'


def load_library(file_path)
    library = YAML.load_file(file_path)
   translation = {"get_meaning" => {}, "get_emoticon" => {}}
     library.each do |meaning, emoticons|
          translation["get_meaning"][emoticons[1]] = meaning
          translation["get_emoticon"][emoticons[0]] = emoticons[1]
         end
     translation
end

def get_japanese_emoticon(file_path, emoticon)
    file_path = './lib/emoticons.yml'
library = load_library(file_path)
if library["get_emoticon"].include?(emoticon)
    library["get_emoticon"][emoticon]
    else
    "Sorry, that emoticon was not found"
end
end

def get_english_meaning(file_path, j_emoticon)
library = load_library('./lib/emoticons.yml')
    if library["get_meaning"].include?(j_emoticon)
    library["get_meaning"][j_emoticon]
    else
       "Sorry, that emoticon was not found"
     end
end
