package NewsExtractor::Constants;
use v5.18;
use utf8;
use warnings;

use Module::Functions;

our %SNRE;
our @EXPORT_OK = ('%SNRE', get_public_functions());

use constant {
    NEWSPAPER_NAMES => [
        'PChome 新聞',
        '一零一傳媒',
        '上報',
        '中國時報',
        '中央社 CNA',
        '中央社',
        '中華日報新聞網',
        '台灣好新聞 TaiwanHot.net',
        '工商時報',
        '新頭殼 Newtalk',
        '旺報',
        '無綫新聞',
        '聯合新聞網',
        '自由娛樂',
        '自由時報電子報',
        '芋傳媒 TaroNews',
        '蕃新聞',
        '蘋果新聞網｜蘋果日報',
        '蘋果日報',
        '鉅亨網',
        'NOWnews 今日新聞',
        '三立新聞網  SETN.COM',
        '青年日報',
        '風傳媒',
        '妞新聞 niusnews',
        '阿波羅網手機版',
        '數位台灣地方新聞',
    ],

    CATEGORY_NAMES => [
        '美股',
        '台股新聞',
        '生活',
        '台灣政經',
        '社會',
        '娛樂',
        '國際',
        '軍視界',
        '生活發現',
    ],
};
$SNRE{newspaper_names} = '(?:' . join('|', map { qr($_) } @{ NEWSPAPER_NAMES() }) . ')';

1;