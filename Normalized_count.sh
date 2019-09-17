extract_miRNAs.pl mature.fa mmu mature > mature_mmu.fa
extract_miRNAs.pl mature.fa mmu star > star_mmu.fa
extract_miRNAs.pl hairpin.fa mmu > hairpin_mmu.fa
cat mature_mmu.fa  star_mmu.fa hairpin_mmu.fa > mmu_miR_index.fa
bowtie-build mmu_miR_index.fa mmu_miR_index
mapper.pl config.txt -e -d -h -I -j -k GTTCAGAGTTCTACAGTCCGACGATC -l 18 -m -p mmu_miR_index -S reads.fa -t reads.arf -v
miRDeep2.pl reads.fa mmu_miR_index.fa reads.arf mature_mmu.fa mature_minus_mmu.fa hairpin_mmu.fa -t Mouse 2 > report.log