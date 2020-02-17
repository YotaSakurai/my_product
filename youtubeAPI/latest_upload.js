<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script>
$(function() {
    $.getJSON(
        'http://ajax.googleapis.com/ajax/services/feed/load?callback=?',
        {
            //xxxxxxxを表示したいチャンネルidに置き換え
            q: 'https://www.youtube.com/feeds/videos.xml?channel_id=UCNjTjd2-PMC8Oo_-dCEss7A',
            v: '1.0',
            num: 10 //取得数
        },
        function (data) {
            $.each(data.responseData.feed.entries, function(i, item){
                $('#youtube ul').append('<li><a href="'+ item.link + '">' +
                        item.title + '<br><img src="' +
                        item.mediaGroups[0].contents[0].thumbnails[0].url + '"></a></li>');
            });
        }
    );
});
</script>