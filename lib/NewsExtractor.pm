package NewsExtractor;
our $VERSION = v0.0.1;
use Moo;

use Mojo::UserAgent;
use Mojo::UserAgent::Transactor;
use Try::Tiny;

use Types::URI qw< Uri >;
use NewsExtractor::Error;
use NewsExtractor::Download;

has url => ( required => 1, is => 'ro', isa => Uri, coerce => 1 );

sub download {
    my NewsExtractor $self = shift;

    my $ua = Mojo::UserAgent->new()->transactor(
        Mojo::UserAgent::Transactor->new()->name('Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:67.0) Gecko/20100101 Firefox/67.0')
    )->max_redirects(3);

    my ($error, $download);

    my $tx = $ua->get( "". $self->url );

    my $res = try { $tx->result } catch {
        $error = NewsExtractor::Error->new(
            is_exception => 0,
            message => $_
        );
    };

    if ($res) {
        if ($res->is_error) {
            $error = NewsExtractor::Error->new(
                is_exception => 0,
                message => $res->message,
            );
        } else {
            $download = NewsExtractor::Download->new( tx => $tx );
        }
    }
    return ($error, $download);
}

1;

__END__

=head1 NAME

NewsExtractor -- download and extract news articles from Internet.

=head1 SYNOPSIS

    my ($error, $article) = NewsExtractor->new( url => $url )->download->parse;
    die $error if $error;

    # $article is an instance of NewsExtractor::Article
    say "Headline: " . $article->headline;
    say "When: " . ($article->dateline // "(unknown)");
    say "By: " . ($article->journalist // "(unknown)");
    say "\n" . $article->content_text;

=head1 AUTHOR

Kang-min Liu <gugod@gugod.org>

=head1 LICENSE

To the extent possible under law, Kang-min Liu has waived all copyright and related or neighboring rights to NewsExtractor. This work is published from: Taiwan.

https://creativecommons.org/publicdomain/zero/1.0/

=cut
