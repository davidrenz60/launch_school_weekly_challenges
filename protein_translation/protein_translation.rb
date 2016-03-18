class Translation
  PROTEINS = { Methionine: ['AUG'],
               Phenylalanine: ['UUU', 'UUC'],
               Leucine: ['UUA', 'UUG'],
               Serine: ['UCU', 'UCC', 'UCA', 'UCG'],
               Tyrosine: ['UAU', 'UAC'],
               Cysteine: ['UGU', 'UGC'],
               Tryptophan: ['UGG'],
               STOP: ['UAA', 'UAG', 'UGA'] }

  def self.of_codon(str)
    PROTEINS.select { |_, codon| codon.include?(str) }.keys.first.to_s
  end

  def self.of_rna(str)
    fail InvalidCodonError if str =~ /[^AUGC]/
    codons = str.scan(/.../)
    proteins = []
    codons.each do |codon|
      return proteins if PROTEINS[:STOP].include?(codon)
      proteins << of_codon(codon)
    end
    proteins
  end
end

class InvalidCodonError < StandardError; end
