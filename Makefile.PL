use inc::Module::Install;
name 'Plack-Middleware-Expires';
all_from 'lib/Plack/Middleware/Expires.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

requires 'Plack', 0.9937;
requires 'LWP::UserAgent';
requires 'parent';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
