# Deoxyribonucleic acid, DNA is the primary information storage molecule in biological systems.
# It is composed of four nucleic acid bases Guanine ('G'), Cytosine ('C'), Adenine ('A'), and Thymine ('T').

# Ribonucleic acid, RNA, is the primary messenger molecule in cells.
# RNA differs slightly from DNA its chemical structure and contains no Thymine.
# In RNA Thymine is replaced by another nucleic acid Uracil ('U').

# Create a funciton which translates a given DNA string into RNA.

# For example:

# DNAtoRNA("GCAT") returns ("GCAU")
# The input string can be of arbitrary length - in particular, it may be empty.
# All input is guaranteed to be valid, i.e. each input string will only ever consist of
# 'G', 'C', 'A' and/or 'T'.

def DNAtoRNA(dna)
  dna.gsub('T', 'U')
end

# The central dogma of molecular biology is that DNA is transcribed into RNA,
# which is then tranlsated into protein. RNA, like DNA, is a long strand of nucleic acids
# held together by a sugar backbone (ribose in this case). Each segment of three bases is called a codon.
# Molecular machines called ribosomes translate the RNA codons into amino acid chains,
# called polypeptides which are then folded into a protein.

# Protein sequences are easily visualized in much the same way that DNA and RNA are,
# as large strings of letters. An important thing to note is that the 'Stop' codons do not encode
# for a specific amino acid. Their only function is to stop translation of the protein,
# as such they are not incorporated into the polypeptide chain.
# 'Stop' codons should not be in the final protein sequence.

# Given a string of RNA, create a funciton which translates the RNA into its protein sequence.

# protein('UGCGAUGAAUGGGCUCGCUCC') returns 'CDEWARS'

$codons = {
    # Phenylalanine
    'UUC'=>'F', 'UUU'=>'F',
    # Leucine
    'UUA'=>'L', 'UUG'=>'L', 'CUU'=>'L', 'CUC'=>'L','CUA'=>'L','CUG'=>'L', 
    # Isoleucine
    'AUU'=>'I', 'AUC'=>'I', 'AUA'=>'I', 
    # Methionine
    'AUG'=>'M', 
    # Valine
    'GUU'=>'V', 'GUC'=>'V', 'GUA'=>'V', 'GUG'=>'V', 
    # Serine
    'UCU'=>'S', 'UCC'=>'S', 'UCA'=>'S', 'UCG'=>'S', 'AGU'=>'S', 'AGC'=>'S', 
    # Proline
    'CCU'=>'P', 'CCC'=>'P', 'CCA'=>'P', 'CCG'=>'P', 
    # Threonine
    'ACU'=>'T', 'ACC'=>'T', 'ACA'=>'T', 'ACG'=>'T',
    # Alanine
    'GCU'=>'A', 'GCC'=>'A', 'GCA'=>'A', 'GCG'=>'A', 
    # Tyrosine
    'UAU'=>'Y', 'UAC'=>'Y', 
    # Histidine
    'CAU'=>'H', 'CAC'=>'H',
    # Glutamine
    'CAA'=>'Q', 'CAG'=>'Q', 
    # Asparagine
    'AAU'=>'N', 'AAC'=>'N', 
    # Lysine
    'AAA'=>'K', 'AAG'=>'K',
    # Aspartic Acid
    'GAU'=>'D', 'GAC'=>'D', 
    # Glutamic Acid
    'GAA'=>'E', 'GAG'=>'E',
    # Cystine
    'UGU'=>'C', 'UGC'=>'C',
    # Tryptophan
    'UGG'=>'W', 
    # Arginine
    'CGU'=>'R', 'CGC'=>'R', 'CGA'=>'R', 'CGG'=>'R', 'AGA'=>'R', 'AGG'=>'R', 
    # Glycine
    'GGU'=>'G',  'GGC'=>'G', 'GGA'=>'G', 'GGG'=>'G', 
    # Stop codon
    'UAA'=>'Stop', 'UGA'=>'Stop', 'UAG'=>'Stop'
  }

  def protein(rna)
    i = 0
    protein = []
    while i < rna.length do
      polypeptide = $codons[rna[i..(i+2)]]
      if polypeptide != 'Stop'
        protein << polypeptide
      i += 3
      else
        break
      end
    end  
      protein.join
  end      

  # puts protein('UGCGAUGAAUGGGCUCGCUCC')