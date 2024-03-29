
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'File::Find' => '0',
    'File::Temp' => '0',
    'Module::Build' => '0.3601',
    'Test::More' => '0.88'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Add release tests for POD links',
  'dist_author' => [
    'Randy Stauner <rwstauner@cpan.org>'
  ],
  'dist_name' => 'Dist-Zilla-Plugin-Test-Pod-LinkCheck',
  'dist_version' => '1.001',
  'license' => 'perl',
  'module_name' => 'Dist::Zilla::Plugin::Test::Pod::LinkCheck',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Dist::Zilla::Plugin::InlineFiles' => '0',
    'Moose' => '0',
    'Test::Pod::LinkCheck' => '0.005',
    'perl' => '5.006'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
