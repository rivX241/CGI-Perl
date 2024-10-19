#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
print "Ingrese su nombre: ";
my $nombre = <STDIN>;
chomp($nombre);
print "Ingrese el dominio: ";
my $dominio = <STDIN>;
print "$nombre\@$dominio";
