#!/usr/bin/perl

eval 'exec /usr/bin/perl  -S $0 ${1+"$@"}'
  if 0;    # not running under some shell

use utf8;
use 5.006;
use strict;
use warnings FATAL => 'all';
use Module::Build;

my $builder = Module::Build->new(

    module_name        => 'Johana',
    license            => 'perl',
    dist_author        => q{Daniel Șuteu   (<trizenx@gmail.com>)},
    dist_version_from  => 'lib/Sidef.pm',
    dist_abstract      => 'The Johana Programming Language',
    release_status     => 'unstable',
    configure_requires => {
                           'Module::Build' => 0,
                          },
    build_requires => {
                       'Test::More' => 0,
                      },

    meta_merge => {
                   resources => {
                                 repository => 'https://github.com/trizen/johana'
                                }
                  },

    requires => {
                 'perl'           => '5.16.1',
                 'utf8'           => 0,
                 'Cwd'            => 0,
                 'File::Spec'     => 0,
                 'File::Path'     => 0,
                 'File::Copy'     => 0,
                 'File::Find'     => 0,
                 'File::Basename' => 0,
                 'List::Util'     => 1.33,
                 'Math::BigRat'   => 0,
                 'Math::BigInt'   => 0,
                 'Socket'         => 0,
                 'Fcntl'          => 0,
                 'Encode'         => 0,
                 'POSIX'          => 0,
                 'Storable'       => 0,
                 'Scalar::Util'   => 0,
                 'Time::HiRes'    => 0,
                 'Getopt::Std'    => 0,
                 'Term::ReadLine' => 0,
                },

    auto_features => {
                      dump_support => {
                                       description => "Dump the AST of a parsed source code. (-d, -D)",
                                       requires    => {
                                                    'Data::Dump' => 0,
                                                   },
                                      },
                     },

    add_to_cleanup     => ['Johana-*'],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
