use strict;
use Test::More tests => 2;

use Plack::Builder;
use Plack::Test;
use Plack::Middleware::Expires;
use Plack::Util;

my $app = builder {
    enable 'Expires', content_type => qr!^text/!i, expires => 'A3600';
    sub { [200, [ 'Content-Type' => 'text/plain' ], [ "Hello World" ]] };
};

test_psgi
    app => $app,
    client => sub {
          my $cb = shift;
          my $req = HTTP::Request->new(GET => "http://localhost/");
          my $res = $cb->($req);
          is( $res->header('Expires'), HTTP::Date::time2str(time+3600) );
          like( $res->header('Cache-Control'), qr/max-age=3600/ );
    };


