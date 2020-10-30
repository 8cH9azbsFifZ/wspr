#!/usr/bin/perl
sub latlong2maidenhead;
sub maidenhead2latlong;

sub maidenhead2latlong {
 
  # convert a Maidenhead Grid location (eg FN03ir)
  #  to decimal degrees
  # this code could be cleaner/shorter/clearer
  my @locator =
    split( //, uc(shift) );    # convert arg to upper case array
  my $lat      = 0;
  my $long     = 0;
  my $latdiv   = 0;
  my $longdiv  = 0;
  my @divisors = ( 72000, 36000, 7200, 3600, 300, 150 )
    ;                          # long,lat field size in seconds
  my $max = ( $#locator > $#divisors ) ? $#divisors : $#locator;
 
  for ( my $i = 0 ; $i <= $max ; $i++ ) {
    if ( int( $i / 2 ) % 2 ) {    # numeric
      if ( $i % 2 ) {             # lat
        $latdiv = $divisors[$i];    # save for later
        $lat += $locator[$i] * $latdiv;
      }
      else {                        # long
        $longdiv = $divisors[$i];
        $long += $locator[$i] * $longdiv;
      }
    }
    else {                          # alpha
      my $val = ord( $locator[$i] ) - ord('A');
      if ( $i % 2 ) {               # lat
        $latdiv = $divisors[$i];    # save for later
        $lat += $val * $latdiv;
      }
      else {                        # long
        $longdiv = $divisors[$i];
        $long += $val * $longdiv;
      }
    }
  }
  $lat  += ( $latdiv / 2 );         # location of centre of square
  $long += ( $longdiv / 2 );
  return ( ( $lat / 3600 ) - 90, ( $long / 3600 ) - 180 );
}
 
sub latlong2maidenhead {
 
  # convert a WGS84 coordinate in decimal degrees
  #  to a Maidenhead grid location
  my ( $lat, $long ) = @_;
  my @divisors =
    ( 72000, 36000, 7200, 3600, 300, 150 );    # field size in seconds
  my @locator = ();
 
  # add false easting and northing, convert to seconds
  $lat  = ( $lat + 90 ) * 3600;
  $long = ( $long + 180 ) * 3600;
  for ( my $i = 0 ; $i < 3 ; $i++ ) {
    foreach ( $long, $lat ) {
      my $div  = shift(@divisors);
      my $part = int( $_ / $div );
      if ( $i == 1 ) {    # do the numeric thing for 2nd pair
        push @locator, $part;
      }
      else {              # character thing for 1st and 3rd pair
        push @locator,
          chr( ( ( $i < 1 ) ? ord('A') : ord('a') ) + $part );
      }
      $_ -= ( $part * $div );    # leaves remainder in $long or $lat
    }
  }
  return join( '', @locator );
}

