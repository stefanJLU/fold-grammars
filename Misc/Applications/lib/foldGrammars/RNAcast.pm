#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;
use foldGrammars::Utils;
use foldGrammars::Settings;

package RNAcast;


sub cast_doComputation {
	my ($input, $settings, $refSub_buildCommand, $refHash_param, $MODE_SHAPES) = @_;
	
	#determine common shapes
		my %commonShapes = ();
		my %mfes = ();
		my $sequenceNumber = 0;
		my @orederedSeqs = ();
		Utils::applyFunctionToFastaFile($input, \&cast_generateSingleShapes, $settings, \%commonShapes, \$sequenceNumber, \%mfes, \@orederedSeqs, $refSub_buildCommand, $MODE_SHAPES);
		my $maxMFE = 0;
		my $maxEnergyLen = 0;
		foreach my $shape (keys(%mfes)) {
			$maxMFE += $mfes{$shape};
			my $energy = sprintf("%.2f", $mfes{$shape}/100);
			$maxEnergyLen = length($energy) if ($maxEnergyLen < length($energy));
		}

	#score common shapes
		my %commonShapes_infos = ();
		foreach my $shape (keys(%commonShapes)) {
			my $energySum = 0;
			foreach my $seqs (keys(%{$commonShapes{$shape}})) {
				$energySum += $commonShapes{$shape}->{$seqs}->{energy};
			}
			$commonShapes_infos{$shape} = {score => $energySum};
		}
	
	#print results
		my $shapeNr = 0;
		foreach my $shape (sort {$commonShapes_infos{$a}->{score} <=> $commonShapes_infos{$b}->{score}} keys(%commonShapes_infos)) { 
			print "".(++$shapeNr).")".$IO::SEPARATOR."Shape: ".$shape.$IO::SEPARATOR."Score: ".sprintf("%.2f", $commonShapes_infos{$shape}->{score}/100).$IO::SEPARATOR."Ratio of MFE: ".sprintf("%1.2f", $commonShapes_infos{$shape}->{score}/$maxMFE)."\n";
			foreach my $refHash_sequence (@orederedSeqs) {
				print IO::output({'0'.$IO::DATASEPARATOR.length($refHash_sequence->{sequence}) => {dummyblock => {$commonShapes{$shape}->{$refHash_sequence->{header}}->{structure} => {score => $commonShapes{$shape}->{$refHash_sequence->{header}}->{energy}/100, shape => $shape, rank => $commonShapes{$shape}->{$refHash_sequence->{header}}->{rank}}}}}, $refHash_sequence, $IO::PROG_RNASHAPES, $settings, {energy => $maxEnergyLen, windowStartPos => 1}, undef, undef); # $predictions{$windowPos}->{$structure}); # my ($predictions, $input, $program, $settings, $fieldLengths, $sumPfunc, $samples) = @_;
			}
			print "\n";
		}
		
		if ($shapeNr == 0) {
			print "No consensus shapes found. Try to increase energy range with --".$refHash_param->{absolutedeviation}->{key}." or --".$refHash_param->{relativedeviation}->{key}.".\n";
		}
}

sub cast_generateSingleShapes {
	my ($refHash_sequence, $settings, $refHash_commonShapes, $ref_sequenceNr, $refHash_mfes, $refList_orderedSeqs, $refSub_buildCommand, $MODE_SHAPES) = @_;
	${$ref_sequenceNr}++;
	push @{$refList_orderedSeqs}, $refHash_sequence;
	
	if ($refHash_sequence->{sequence} !~ m/^\s*((A|C|G|U|T)+)\s*$/i) {
		die "sequence '".$refHash_sequence->{header}."' contains non RNA letter. Only A,C,G,U,T,a,c,g,u,t are allowed!\n";
	}
	my $seq = $refHash_sequence->{sequence};
	$seq =~ s/t/u/gi;
	
	my %cast_settings = %{$settings};
	$cast_settings{'mode'} = $MODE_SHAPES;
	my $command = &{$refSub_buildCommand}(\%cast_settings, undef);
	my $result = qx($command "$seq");

	#add new common shapes, if a) this is the first sequence b) this shape was already common
		my @unsortedShapes = ();
		foreach my $line (split(m/\r?\n/, $result)) {
			push @unsortedShapes, {shape => $1, energy => $2, structure => $3} if ($line =~ m/\( \( (.+?) , (.+?) \) , (.+?) \)/);
		}
		
		my $rank = 0;
		my $mfe = 0;
		foreach my $refHash_shape (sort {$a->{energy} <=> $b->{energy}} @unsortedShapes) {
			$rank++;
			$mfe = $refHash_shape->{energy} if ($rank == 1);
			$refHash_commonShapes->{$refHash_shape->{shape}}->{$refHash_sequence->{header}} = {energy => $refHash_shape->{energy}, structure => $refHash_shape->{structure}, rank => $rank} if ((${$ref_sequenceNr} <= 1) || (exists $refHash_commonShapes->{$refHash_shape->{shape}}));
		}
		$refHash_mfes->{$refHash_sequence->{header}} = $mfe;
	
	#remove "common" shapes that have not appeared for this sequence
		foreach my $commonshape (keys(%{$refHash_commonShapes})) {
			if (keys(%{$refHash_commonShapes->{$commonshape}}) < ${$ref_sequenceNr}) {
				delete $refHash_commonShapes->{$commonshape};
			}
		}
	
	return undef;
}

1;