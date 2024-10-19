#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use List::Util qw(max min);

sub calcularPromedio {
    my @notas = @_;

    print "Notas originales: @notas\n";

    my $nota_minima = min(@notas);
    my @notas_sin_minima;

    my $encontrada = 0;
    foreach my $nota (@notas) {
        if ($nota == $nota_minima && !$encontrada) {
            $encontrada = 1;
        } else {
            push @notas_sin_minima, $nota;
        }
    }

    my $nota_maxima = max(@notas_sin_minima);
    push @notas_sin_minima, $nota_maxima;

    print "Notas modificadas: @notas_sin_minima\n";

    my $suma = 0;
    $suma += $_ for @notas_sin_minima;
    my $promedio = $suma / @notas_sin_minima;

    return $promedio;
}

print "Ingrese el número de notas a ingresar: ";
my $numNotas = <STDIN>;
chomp($numNotas);

my @notas = ();
for (my $i = 1; $i <= $numNotas; $i++) {
    print "Ingrese la nota N°$i: ";
    my $notaIngresada = <STDIN>;
    chomp($notaIngresada);
    push(@notas, $notaIngresada);
}

my $promedio = calcularPromedio(@notas);
print "El promedio calculado es: $promedio\n";
