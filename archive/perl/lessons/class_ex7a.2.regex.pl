use strict;
######################################
# Purpose: Extract annotations from a Genbank genomic record
# Parameters: Input file name
#

# open input file
if (scalar(@ARGV) < 1) {die "USAGE: class_ex.pl INPUT_FILE\n";}
my ($inFile) = @ARGV;
open (IN, "<$inFile") or die "Can't open file '$inFile'\n";
my @lines = <IN>; 
foreach my $line(@lines) {
	chomp $line;

	# Find JOURNAL lines and extract publication year
	# e.g.  JOURNAL   J. Gen. Virol. 84 (Pt 11), 2895-2908 (2003)
	if ($line =~ m/^\s*JOURNAL.*\((\d{4})\)/) {
		print "$1\n";
	}
}
close(IN);

