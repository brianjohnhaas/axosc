#!/usr/bin/env perl

use strict;
use warnings;


my %cats = ( 'Testes' => 1,
             'Ovaries' => 1,
             'skeletal' => 1,
             "elbow,forearm,hand,upperarm" => 1,
             'blood' => 1,
             'heart' => 1,
             'Bone' => 1,
             "Ovaries,Testes" => 1,
             "distal,proximal" => 1,
             "CartLong,CartWrist" => 1,
             'hand' => 1 );



main: {

    my %feature_lists;
    
    open(my $fh, "Table_S3.tissue_enriched_transcripts.xls") or die $!;
    while (<$fh>) {
        chomp;
        my @x = split(/\t/);
        my $feature_id = $x[0];
        my $cat = $x[1];
        $cat =~ s/\"//g;
        
        if (exists $cats{$cat}) {
            push (@{$feature_lists{$cat}}, $feature_id);
        }
    }
    close $fh;

    foreach my $cat (keys %feature_lists) {
        
        my @entries = @{$feature_lists{$cat}};
        
        $cat =~ s/,/_/g;
        
        print "$cat = c(\"" . join("\",\"", @entries) . "\")\n";
        
    }
    
    exit(0);
}

