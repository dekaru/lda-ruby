module Lda
  class TextCorpus < Corpus
    attr_reader :filename

    # Load text documents from YAML file if filename is given.
    def initialize(filename, stop_words_list = nil)
      super(stop_words_list)

      @filename = filename
      load_from_file
    end

    protected

    def load_from_file
      text = File.open(@filename).read
      text.gsub!(/\r\n?/, "\n")
      text.each_line do |line|
        add_document(TextDocument.new(self, line))
      end

      #docs = YAML.load_file(@filename)
      #docs.each do |doc|
        #add_document(TextDocument.new(self, doc))
      #end
    end
  end
end
