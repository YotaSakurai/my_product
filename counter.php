<?PHP
	function h($s){
		return htmlspecialchars($s, ENT_QUOTES, 'UTF-8');
	}		
	function h2($s){
		return htmlentities($s);
	}
	

	function getlog(){			
		$user_ip = getenv("REMOTE_ADDR");
		$user_agent = $_SERVER['HTTP_USER_AGENT'];
		$access_time = date("Y-m-d,H:i:s");//この配列に日付けや時間が入ってる
		$csv_filename = "accesslog.csv";
		$ary = array($user_agent, $user_ip, $access_time);
		//chmod("/home/developers/sakurai/public_html/task/work1", );
		$f = fopen($csv_filename, "a");
		fputcsv($f, $ary);
		fclose($f);
	}
	getlog();
			
	if(isset($_POST['Text']) == 'TRUE'){
		$comment = $_POST['Text'];
		XSS_escapeForHTML($comment);
		$Counter = mb_strlen($comment);
		echo "入力内容";
		echo "<br>";
		echo $comment;
		echo "<br />";	
		echo "文字数:";
		echo $Counter;
		$text_filename = 'count.txt';
		file_put_contents($text_filename, $comment);
	}else{
		$comment = '';
	}

	//error example "<script>alert("XSS");</script>"
	function XSS_escapeForHTML($value){
		if(is_array ( $value )){
			$Result = array ();
			foreach ( array_keys ( $value ) as $key ){
				$Result [$key] = $this->XSS_escapeForHTML ( $value [$key] );
			}
			return $Result;
		}else{
			$value = htmlspecialchars ( $value, ENT_QUOTES, 'EUC-JP', false );
			// $value = n12br($value);
			return $value;
		}
	}
	//XSS_escapeForHTML($comment);	
	$test = '<script>alert("XSS");</script>'
	
?>

<!DOCTYPE html>
<HTML lang = "ja">
	<HEAD>	
		<META charset="UFT-8">
			<TITLE>text counter</TITLE>
			<script language="JavaScript">
			window.document.onkeydown = function () 
			{
				 if (event.keyCode == 116) 
				 { 
				 	
				 } 
			}
		</script>
	</HEAD>
	<BODY>
		<H1>フォームデータの送信</H1>
		<div>
		<span><?php echo h($test); ?></span>
			<a>カウントするにはF5キーまたは送信ボタンをクリック</a>
			<form action="http://sakurai.zxcv.jp/task/work1/counter.php" method="post">
				<p><input type="text" name="Text" value="<?php echo h($comment); ?>" > </p>
				<p><input type="submit" value="送信" accesskey=116></p>
			</form>
		</div>
		<div>
			<a>送信結果の確認は<a href = 'http://sakurai.zxcv.jp/task/work1/count.txt'>こちら</a></a>			
			<a>アクセスログを確認: <a href='http://sakurai.zxcv.jp/task/work1/accesslog.csv'>する</a><a>/</a><a href = 'http://sakurai.zxcv.jp/task/work1/NotConfirm.txt'>しない</a></a>
		</div>
		<div>
			<a href = 'http://sakurai.zxcv.jp/task/work1/counter.php'>ページをリロード</a>
		</div>
		<div>
			<a href='http://sakurai.zxcv.jp/task/work1'>戻る</a>
			<form name=login action="http://sakurai.zxcv.jp/task/try/getinfo.txt" method="post">
   ID <input type="text" name="id"> <br />	//データを抜き取って別サイトに送信したい
   パスワード <input type="text" name="pass"> <br />
</form>
		</div>
		<iframe src=https://ja.wikipedia.org/wiki/%E3%82%AF%E3%83%AD%E3%82%B9%E3%82%B5%E3%82%A4%E3%83%88%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0#mw-headline width = 500 height=500></iframe>
	</BODY>
</HTML>



