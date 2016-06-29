use strict;
use warnings;
use ExtUtils::MakeMaker;

my $MM_Version = $ExtUtils::MakeMaker::VERSION;

if ( $MM_Version =~ /_/ )    # dev version
{
    $MM_Version = eval $MM_Version;
    die $@ if ($@);
}

WriteMakefile(
    NAME                => 'Net::LDAP::Batch',
    AUTHOR              => 'Peter Karman <karman@cpan.org>',
    VERSION_FROM        => 'lib/Net/LDAP/Batch.pm',
    ABSTRACT_FROM       => 'lib/Net/LDAP/Batch.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'Class::Accessor::Fast' => 0,
        'Scalar::Util' => 0,
        'Data::Dump' => 0,
        'Net::LDAP'  => 0,
        'Net::LDAP::Server::Test' => 0.17,  # bug in 0.16

    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Net-LDAP-Batch-*' },
    ( $MM_Version >= 6.48 ? ( MIN_PERL_VERSION => '5.8.3' ) : () ),
    ( $MM_Version >= 6.31 ? ( LICENSE          => 'perl' )  : () ),
    (   $MM_Version <= 6.44 ? ()
        :

            (
            META_MERGE => {
                resources => {
                    license  => 'http://dev.perl.org/licenses/',
                    homepage => 'https://github.com/karpet/net-ldap-batch',
                    bugtracker =>
                        'http://rt.cpan.org/NoAuth/Bugs.html?Dist=Net-LDAP-Batch',
                    repository =>
                        'https://github.com/karpet/net-ldap-batch'
                },
            }
            )
    ),
);
