<?php 
$user = "UCNjTjd2-PMC8Oo_-dCEss7A"; //取得したいチャンネルID
$url = "https://www.youtube.com/feeds/videos/xml?channnel_id=".$user;
$rss = file_get_contents($url);
$rss = preg_replace("/<([^>]+?):(.+?)>/", "<$1_$2>", $rss);
$rss = simplexml_load_string($rss, "SimpleXMLElement", LIBXML_NOCDATA);
foreach($rss->entry as $value){
    if ($value === 0){

    }else{
        break;
    }
}
?> 
<iflame width="480" height="360" src="https://www.youtube.com/embed/<?php echo htmlspecialchars($value->yt_videoId,  ENT_QUOTES, 'UTF-8') ?>" frameborder="0" allowfullscreen></iframe>