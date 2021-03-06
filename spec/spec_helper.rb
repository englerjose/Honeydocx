$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'honeydocx'

def get_header(document)
  header = open_xml('word/header1.xml', document)
end

def get_header_rels(document)
  rels = open_xml('word/_rels/header1.xml.rels', document)
end

# Remove spaces and rsids from the header for comparisons.
def clean_xml(header)
  header.gsub(/\s+|w:rsid.*?"[^\"]*"|standalone.*\"/, "")
end

def expected_header
  header = File.open(File.expand_path(
    '../fixtures/header1.xml', __FILE__)).read
end

def expected_header_rels
  header_rels = File.open(File.expand_path(
  '../fixtures/header1.xml.rels', __FILE__)).read
end

def open_xml(filename, path)
  Zip::File.open(path).read(filename)
end
