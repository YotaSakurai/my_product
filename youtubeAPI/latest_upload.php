<?php 
    $arrContextOptions=array(
        "ssl"=>array(
        "verify_peer"=>false,
        "verify_peer_name"=>false,
      ),);
    $user = "UCNjTjd2-PMC8Oo_-dCEss7A"; //取得したいチャンネルID、これはおめシス
    $url = "https://www.youtube.com/feeds/videos/xml?channnel_id=".$user;
    $rss = file_get_contents($url, false, stream_context_create($arrContextOptions));
    printf($rss);
    $rss = preg_replace("/<([^>]+?):(.+?)>/", "<$1_$2>", $rss);
    $rss = simplexml_load_string($rss, "SimpleXMLElement", LIBXML_NOCDATA);
    $i = 0;
    foreach($rss->entry as $value){
        if ($value === 0){
        echo $i;
        $i++;
        }else{
            break;
        }
    }
?> 
<!DOCTYPE html>
<html lang="ja">
    <head>
        <title>
            youtubeの最新動画を取得する
        </title>
    </head>
    <body>
       <?php echo $rss; ?>
        <div class="latest_video">
            指定したyoutube channelの最新動画
            <iframe
                class="video lazy"
                title="【バーチャル双子YouTuber】はじめまして！おめがシスターズです！【自己紹介】"
                data-src="https://www.youtube.com/embed/GgHx7ljXs08"
                frameborder="0"
                allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen
            ></iframe>
        </div>
        <?php echo $user."<br>"; 
              echo "php<br>";
        ?> 
        <!-------second iframe------>
        <!--youtubeのhttps通信が弾かれてできない, 後で修正する-->
        <iflame 
            width="480" 
            height="360" 
            src="https://www.youtube.com/embed/<?php echo htmlspecialchars($value->yt_videoId,  ENT_QUOTES, 'UTF-8') ?>" 
            frameborder="0" 
            allowfullscreen
        ></iframe>
        <!--<iflame width="480" height="360" src="https://www.youtube.com/" frameborder="0" ></iframe>-->
        <iframe 
            width="480" 
            height="360" 
            src="https://www.youtube.com/embed/sxSIDYWBnkY"
            allowfullscreen    
        ></iframe>
    </body>
</html>