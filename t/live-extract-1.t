use v5.18;

use Test2::V0;
use URI;
use NewsExtractor;

my @urls = grep { $_ } split /\s+/m, q(
    https://www.ettoday.net/news/20180717/1214873.htm
    https://www.ettoday.net/news/20180717/1214873.htm
    https://www.ettoday.net/news/20181019/1284979.htm
    https://www.ettoday.net/news/20181019/1284953.htm
    https://www.ettoday.net/news/20181019/1284957.htm
    https://www.ettoday.net/news/20181019/1284972.htm
    https://www.ettoday.net/news/20181019/1284944.htm
    https://www.ettoday.net/news/20181019/1284943.htm
    https://www.ettoday.net/news/20181019/1284933.htm
    https://www.ettoday.net/news/20181019/1284961.htm
    https://www.ettoday.net/news/20181019/1284983.htm
    https://www.ettoday.net/news/20181019/1278734.htm
    https://www.ettoday.net/news/20181019/1284994.htm
    https://www.ettoday.net/news/20181019/1284989.htm
    https://www.ettoday.net/news/20181019/1284985.htm
    https://www.ettoday.net/news/20181019/1284971.htm
    https://www.ettoday.net/news/20181019/1284966.htm
    https://www.ettoday.net/news/20181019/1284960.htm
    https://www.ettoday.net/news/20181019/1284953.htm
    https://www.ettoday.net/news/20181018/1284073.htm
    https://www.ettoday.net/news/20181019/1284979.htm
    https://www.ettoday.net/news/20181019/1284974.htm
    https://www.ettoday.net/news/20170128/855319.htm
    https://www.ettoday.net/news/20180717/1214873.htm
    https://www.ettoday.net/news/20181019/1284995.htm
    https://www.ettoday.net/news/20181019/1284947.htm
    https://www.ettoday.net/news/20181019/1284986.htm
    https://www.ettoday.net/news/20181018/1284346.htm
    https://www.ettoday.net/news/20181019/1284938.htm
    https://www.ettoday.net/news/20181019/1284991.htm
    https://www.ettoday.net/news/20181019/1285005.htm
    https://www.ettoday.net/news/20181019/1285027.htm
    https://www.ettoday.net/news/20181019/1285115.htm
    https://www.ettoday.net/news/20181019/1284443.htm
    https://www.ettoday.net/news/20181019/1284978.htm
    https://www.ettoday.net/news/20181019/1285077.htm
    https://www.ettoday.net/news/20181019/1285091.htm
    https://www.ettoday.net/news/20181019/1285106.htm
    https://www.ettoday.net/news/20181019/1285032.htm
    https://www.ettoday.net/news/20181019/1285094.htm
    https://www.ettoday.net/news/20181019/1285055.htm
    https://www.ettoday.net/news/20181019/1284560.htm
    https://www.ettoday.net/news/20181019/1285101.htm
    https://www.ettoday.net/news/20181019/1285031.htm
    https://www.ettoday.net/news/20181019/1285194.htm
    https://www.ettoday.net/news/20181019/1285016.htm
    https://www.ettoday.net/news/20181019/1285002.htm
    https://www.ettoday.net/news/20181019/1285058.htm
    https://www.ettoday.net/news/20181019/1285130.htm
    https://www.ettoday.net/news/20181019/1285057.htm
    https://www.ettoday.net/news/20181019/1284984.htm
    https://www.ettoday.net/news/20181019/1285029.htm
    https://www.ettoday.net/news/20181019/1285243.htm
    https://www.ettoday.net/news/20181019/1285156.htm
    https://www.ettoday.net/news/20181019/1285045.htm
    https://www.ettoday.net/news/20181019/1285131.htm
    https://www.ettoday.net/news/20181019/1285053.htm
    https://www.ettoday.net/news/20181019/1285061.htm
    https://www.ettoday.net/news/20181019/1284942.htm
    https://www.ettoday.net/news/20181019/1285235.htm
    https://www.ettoday.net/news/20181019/1285234.htm
    https://www.ettoday.net/news/20181019/1285168.htm
    https://www.ettoday.net/news/20181019/1285223.htm
    https://www.ettoday.net/news/20181019/1285244.htm
    https://www.ettoday.net/news/20181019/1285176.htm
    https://www.ettoday.net/news/20181019/1285206.htm
    https://www.ettoday.net/news/20181019/1285306.htm
    https://www.ettoday.net/news/20181019/1285221.htm
    https://www.ettoday.net/news/20181019/1285007.htm
    https://www.ettoday.net/news/20181019/1285097.htm
    https://www.ettoday.net/news/20181019/1285249.htm
    https://www.ettoday.net/news/20181019/1285111.htm
    https://www.ettoday.net/news/20181019/1285254.htm
    https://www.ettoday.net/news/20181019/1285112.htm
    https://www.ettoday.net/news/20181019/1285158.htm
    https://www.ettoday.net/news/20181019/1285123.htm
    https://www.ettoday.net/news/20181019/1285074.htm
    https://www.ettoday.net/news/20181019/1284952.htm
    https://www.ettoday.net/news/20181019/1284967.htm
    https://www.ettoday.net/news/20181019/1281980.htm
    https://www.ettoday.net/news/20181019/1285266.htm
    https://www.ettoday.net/news/20181019/1285281.htm
    https://www.ettoday.net/news/20181019/1285292.htm
    https://www.ettoday.net/news/20181019/1285296.htm
    https://www.ettoday.net/news/20181019/1285299.htm
    https://www.ettoday.net/news/20181019/1285290.htm
    https://www.ettoday.net/news/20181019/1285274.htm
    https://www.ettoday.net/news/20181019/1285285.htm
    https://www.ettoday.net/news/20181019/1284747.htm
    https://www.ettoday.net/news/20181008/1276053.htm
    https://www.ettoday.net/news/20181019/1285351.htm
    https://www.ettoday.net/news/20181019/1285141.htm
    https://www.ettoday.net/news/20181019/1285242.htm
    https://www.ettoday.net/news/20181019/1285337.htm
    https://www.ettoday.net/news/20181019/1285066.htm
    https://www.ettoday.net/news/20181019/1285207.htm
    https://www.ettoday.net/news/20181019/1285060.htm
    https://www.ettoday.net/news/20181019/1284937.htm
    https://www.ettoday.net/news/20181019/1285332.htm
    https://www.ettoday.net/news/20181019/1285360.htm
    https://www.ettoday.net/news/20181019/1282452.htm
    https://www.ettoday.net/news/20181019/1285352.htm
    https://www.ettoday.net/news/20181019/1285347.htm
    https://www.ettoday.net/news/20181019/1285364.htm
    https://www.ettoday.net/news/20181019/1285268.htm
    https://www.ettoday.net/news/20181019/1285358.htm
    https://www.ettoday.net/news/20181019/1285369.htm
    https://www.ettoday.net/news/20181019/1285331.htm
    https://www.ettoday.net/news/20181019/1285200.htm
    https://www.ettoday.net/news/20181019/1285170.htm
    https://www.ettoday.net/news/20181019/1285233.htm
    https://www.ettoday.net/news/20181019/1285312.htm
    https://www.ettoday.net/news/20181019/1285470.htm
    https://www.ettoday.net/news/20181019/1285086.htm
    https://www.ettoday.net/news/20181019/1285110.htm
    https://www.ettoday.net/news/20181019/1285435.htm
    https://www.ettoday.net/news/20181019/1285456.htm
    https://www.ettoday.net/news/20181019/1285404.htm
    https://www.ettoday.net/news/20181019/1285400.htm
    https://www.ettoday.net/news/20181019/1285070.htm
    https://www.ettoday.net/news/20181019/1285411.htm
    https://www.ettoday.net/news/20181019/1285483.htm
    https://www.ettoday.net/news/20181019/1285502.htm
    https://www.ettoday.net/news/20181019/1285216.htm
    https://www.ettoday.net/news/20181019/1285476.htm
    https://www.ettoday.net/news/20181019/1285477.htm
    https://www.ettoday.net/news/20181019/1285129.htm
    https://www.ettoday.net/news/20181019/1285468.htm
    https://www.ettoday.net/news/20181019/1285399.htm
    https://www.ettoday.net/news/20181019/1285458.htm
    https://www.ettoday.net/news/20181019/1285376.htm
    https://www.ettoday.net/news/20181019/1285020.htm
    https://www.ettoday.net/news/20181019/1284998.htm
    https://www.ettoday.net/news/20181019/1285484.htm
    https://www.ettoday.net/news/20181019/1285398.htm
    https://www.ettoday.net/news/20181019/1285597.htm
    https://www.ettoday.net/news/20181019/1285340.htm
    https://www.ettoday.net/news/20181019/1285479.htm
    https://www.ettoday.net/news/20181019/1285367.htm
    https://www.ettoday.net/news/20181019/1285293.htm
    https://www.ettoday.net/news/20181019/1285023.htm
    https://www.ettoday.net/news/20181019/1285615.htm
    https://www.ettoday.net/news/20181019/1285611.htm
    https://www.ettoday.net/news/20181019/1285466.htm
    https://www.ettoday.net/news/20181019/1285314.htm
    https://www.ettoday.net/news/20181019/1285228.htm
    https://www.ettoday.net/news/20181019/1285442.htm
    https://www.ettoday.net/news/20181019/1285431.htm
    https://www.ettoday.net/news/20181019/1285565.htm
    https://www.ettoday.net/news/20181019/1285428.htm
    https://www.ettoday.net/news/20181019/1285186.htm
    https://www.ettoday.net/news/20181019/1285638.htm
    https://www.ettoday.net/news/20181019/1285669.htm
    https://www.ettoday.net/news/20181019/1279666.htm
    https://www.ettoday.net/news/20181019/1281516.htm
    https://www.ettoday.net/news/20181019/1285581.htm
    https://www.ettoday.net/news/20181019/1285706.htm
    https://www.ettoday.net/news/20181019/1285704.htm
    https://www.ettoday.net/news/20181019/1285676.htm
    https://www.ettoday.net/news/20181019/1285643.htm
    https://www.ettoday.net/news/20181019/1285640.htm
    https://www.ettoday.net/news/20181019/1285685.htm
    https://www.ettoday.net/news/20181019/1284992.htm
    https://www.ettoday.net/news/20181019/1285735.htm
    https://www.ettoday.net/news/20181019/1285542.htm
    https://www.ettoday.net/news/20181019/1285729.htm
    https://www.ettoday.net/news/20181019/1283612.htm
    https://www.ettoday.net/news/20181019/1285721.htm
    https://www.ettoday.net/news/20181019/1285176.htm
    https://www.ettoday.net/news/20181019/1285045.htm
    https://www.ettoday.net/news/20181019/1285712.htm
    https://www.ettoday.net/news/20181019/1285759.htm
    https://www.ettoday.net/news/20181019/1285344.htm
    https://www.ettoday.net/news/20181019/1285744.htm
    https://www.ettoday.net/news/20181019/1285423.htm
    https://www.ettoday.net/news/20181019/1285046.htm
    https://www.ettoday.net/news/20181019/1285512.htm
    https://www.ettoday.net/news/20181019/1285443.htm
    https://www.ettoday.net/news/20181019/1285667.htm
    https://www.ettoday.net/news/20181019/1285445.htm
    https://www.ettoday.net/news/20181019/1285674.htm
    https://www.ettoday.net/news/20181019/1285724.htm
    https://www.ettoday.net/news/20181019/1285763.htm
    https://www.ettoday.net/news/20181020/1285805.htm
    https://www.ettoday.net/news/20181019/1285616.htm
    https://www.ettoday.net/news/20181020/1273070.htm
    https://www.ettoday.net/news/20181019/1285802.htm
    https://www.ettoday.net/news/20181019/1285741.htm
    https://www.ettoday.net/news/20181019/1285301.htm
    https://www.ettoday.net/news/20181019/1285589.htm
    https://www.ettoday.net/news/20181019/1285524.htm
    https://www.ettoday.net/news/20181020/1285807.htm
    https://www.ettoday.net/news/20181019/1285793.htm
    https://www.ettoday.net/news/20181019/1285803.htm
    https://www.ettoday.net/news/20181019/1285450.htm
    https://www.ettoday.net/news/20181019/1285075.htm
    https://www.ettoday.net/news/20181019/1285607.htm
    https://www.ettoday.net/news/20190726/1498716.htm
    https://www.ettoday.net/news/20190726/1498728.htm
    https://www.ettoday.net/news/20190725/1498576.htm
    https://www.ettoday.net/news/20190725/1498607.htm
);

for my $url (map { $urls[rand($#urls)] } 0..3) {
    my ($error, $x) = NewsExtractor->new(url => $url)->download;

    if ($error) {
        fail "Download failed: $url";
        diag $error->message;
    } else {
        subtest "Extract: $url" => sub {
            my $article = $x->parse;
            ok $article->dateline;
            ok $article->headline;
            ok $article->creator;

            my $y = $article->as_NewsArticle;
            ok $y->dateline;
            ok $y->headline;
            ok $y->creator;
        };
    }
}
done_testing;
