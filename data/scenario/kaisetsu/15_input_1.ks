	; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
	[set_default_view]
	
	
	
; == 15_input_1.ks =========================================
;
; プレイヤーに入力してもらう方法を説明します。
;
; ★登場する主なタグ。
; [edit]   … フリーレイヤーに「入力欄」を出す。ひとつのみ。
; [commit] … 「入力欄」の内容を、[edit]で指定していた変数のなかに入れる。

; ==========================================================
	
	
	
;-----------------------------------------------------------
*Start
;-----------------------------------------------------------
	
		[akn/def]
		アドベンチャーゲームを作る上で――[p]
		【プレイヤーに自由に文字を入力してもらいたいシーン】というのがあるかもしれない。[p]
		[akn/hap]
		たとえば、主人公の名前を決めるとか、主人公の好物を決めるとか。[p]
		[akn/def]
		そういうシーンでは、［edit］と［commit］が使えます。[p]
		このタグを使ったサンプルをいくつか見せてみるね。[p]
	
	
	
;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------
		
		[akn/def]
		まず、主人公の名前を入力してもらったうえで、それをメッセージとして出す方法のサンプル。[p]
		よし!!  じゃあ、ここにあなたの名前を書いてね。[p]
	
	; ------------------------------------------------------
	*Part1_Edit
		
		[layopt layer="message0" visible="false"]
		
		[image layer="1" storage="15_input_A.png" x="0" y="0"]
		
		; [edit] 入力欄を出します。
		[edit name="f.player_name" left="380" top="350" width="260" height="40" size="30" maxchars="8" initial="山田花子"]
		
		; [button] 次に進めるボタンを出します。
		[button graphic="config/arrow_next.png" target="*Part1_Commit" x="440" y="430"]
		
		; [s] ゲームを停止します。[edit]の後には必ずこれを配置する必要があります。
		[s]
		
	; ------------------------------------------------------
	*Part1_Commit
		
		; [commit] このタグによって[edit]の中身が変数 f.player_name に移ります。
		[commit]
		
		; [cm] フリーレイヤーを解放します。
		[cm]
		
		[freeimage layer="1"]
		[layopt layer="message0" visible="true"]
		
		「[emb exp="f.player_name"]」さんっていうんだ？[l][r]
		[nowait]
		[link target="*Part1_OK"  ]【１】そうだ[endlink]／
		[link target="*Part1_Edit"]【２】チガウ[endlink]
		[endnowait]
		[s]
		
	; ------------------------------------------------------
	*Part1_OK
		
		[cm]
		[akn/hap]
		はい!! これであなたも晴れてティラノ部員です。[p]
		これからよろしくね、[emb exp="f.player_name"]さん。[p]
	
	
	
;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------
		
		[akn/def]
		入力欄は複数出すこともできるので、たとえば、苗字と名前を分けることもできる。[p]
		
	; ------------------------------------------------------
	*Part2_Edit
		
		[layopt layer="message0" visible="false"]
		
		[image layer="1" storage="15_input_A.png" x="0" y="0"]
		
		; [edit] 入力欄を出します。
		[edit name="f.player_fname" left="380" top="350" width="120" height="40" size="30" maxchars="4" initial="山田"]
		[edit name="f.player_name"  left="510" top="350" width="120" height="40" size="30" maxchars="4" initial="花子"]
		
		; [button] 次に進めるボタンを出します。
		[button graphic="config/arrow_next.png" target="*Part2_Commit" x="440" y="430"]
		
		; [s] ゲームを停止します。[edit]の後には必ずこれを配置する必要があります。
		[s]
		
	; ------------------------------------------------------
	*Part2_Commit
		
		; [commit] このタグによって[edit]の中身が変数 f.player_name に移ります。
		[commit]
		
		; [cm] フリーレイヤーを解放します。
		[cm]
		
		[freeimage layer="1"]
		[layopt layer="message0" visible="true"]
		
		「[emb exp="f.player_fname"]　[emb exp="f.player_name"]」さんっていうんだ？[l][r]
		[nowait]
		[link target="*Part2_OK"  ]【１】そうだ[endlink]／
		[link target="*Part2_Edit"]【２】チガウ[endlink]
		[endnowait]
		[s]
		
	; ------------------------------------------------------
	*Part2_OK
		
		[cm]
		
			[akn/hap]
			なるほどね……。[p]
			[akn/def]
			名前と苗字、どっちが好き？[l][r]
		
		[nowait]
		[link target="*Part2_Fname"]【１】苗字でーす[endlink]／
		[link target="*Part2_Name" ]【２】名前かな…[endlink]
		[endnowait]
		[s]
		
	; ------------------------------------------------------
	*Part2_Fname
		
		[eval exp="f.name_type = 0"]
		[jump target="*Part2_End"]
		
	; ------------------------------------------------------
	*Part2_Name
		
		[eval exp="f.name_type = 1"]
		[jump target="*Part2_End"]
		
	; ------------------------------------------------------
	*Part2_End
		
		[cm]
		
		[macro name="花子"]
			
			[font color="0xddffdd"]
			
			[if exp="f.name_type == 0"]
				[emb exp="f.player_fname"]
			[else]
				[emb exp="f.player_name"]
			[endif]
			
			[resetfont]
		[endmacro]
		
		[akn/hap]
		そっか。[p]
		じゃああなたのこと、私は「[花子]さん」って呼ぼうかな。[p]
	
	
	
;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------
	
	; ------------------------------------------------------
	*Part3_Edit
		
		[akn/def]
		……ところで。[p]
		[花子]さんは、好きな恐竜とかいるの？[p]
		……いるでしょ？？　好きな恐竜。[p]
		よかったら、教えてよ～。[p]
		
		[layopt layer=message0 visible=false]
		
		[image layer=1 storage=15_input_B.png x=0 y=0]
		[edit name="f.like_comics" left="310" top="300" width="330" height="60" size="40" initial="ティラノサウルス"]
		[button graphic="config/arrow_next.png" target="*Part3_Commit" x="660" y="295"]
		[s]
		
	; ------------------------------------------------------
	*Part3_Commit
		
		; [commit] [edit]の内容を確定します。
		[commit]
		
		; [cm]
		[cm]
		[freeimage layer=1]
		[layopt layer=message0 visible=true]
		
		「[emb exp="f.like_comics"]」が好きなんだ？[p]
		
		[if exp="f.like_comics == 'ティラノサウルス'"]
			[akn/hap]ねー!! やっぱりティラノサウルスだよねーっ!![p]
		[elsif exp="f.like_comics == 'プテラノドン'"]
			[akn/hap]プテラノかー!! やっぱり空飛ぶのはカッコイイもんね!![p]
		[elsif exp="f.like_comics == 'プレシオサウルス'"]
			[akn/hap]プレシオ!! 代表的な首長竜だね。[p]
			厳密には恐竜じゃなくて爬虫類だけど、カッコ良さでは変わらない!![p]
		[else]
			[akn/dok]私とはちょっと趣味が違うかも。。。[p]
		[endif]
	
	
	
;-----------------------------------------------------------
*End
;-----------------------------------------------------------
		
		[akn/def]……。[p]…………。[p]
		……これが、プレイヤーに文字を自由入力してもらう方法です。[p]
		[akn/def]資料集のほうに、もう少し高度な利用法も載せておくので――[p]
		もし興味があったらチェックしてみてね。[p]
		[akn/hap]ではでは～。[p]
	
	; [jump] 目次画面にジャンプします。
	[jump storage="select.ks"]
	
	/*
;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------
	
	#akane:default
	
	; [eval] ゲーム変数f.player_nameに'太郎'という文字列を入れます。
	[eval exp=" f.player_name = '山田花子' "]
	
	; ------------------------------------------------------
	*Part2_Edit
		
		; --名前の入力欄を表示するラベル。
		
			[cm]入部届にあなたの名前を書いてね。
		
		; [edit] 入力欄を出します。
		[edit name="f.player_name" left="380" top="350" maxchars="8" initial="& f.player_name"]
		
		; [button] 次に進めるボタンを出します。
		[button graphic="ok.png" target="*Commit_Name" x="490" y="450"]
		
		; [s] ゲームを停止します。[edit]の後には必ず配置する必要があります。
		[s]
		
	; ------------------------------------------------------
	*Part2_Commit
		
		; --名前を一時的に確定するラベル。
		
		; [commit] [edit]の内容を確定します。
		[commit]
		
		; [jump] 何も入力されていなかった場合に専用のラベルに飛ばす処理。
		; condパラメータには「タグの実行条件」をJavaScript文で記述します。
		; 以下のように記述することで、「何も入力されていなかったとき」のみこのタグが実行されます。
		[jump target="*Blank_Name" cond=" f.player_name == '' "]
		
		/*
		★余談。
		もっと厳密に空欄チェックをしたい場合、次のように記述してみましょう。
		
			[iscript]
				tf.flag = !!$f.player_name.match(/^[ 　\r\n\t]*$/);
			[endscript]
			[jump target="*Blank_Name" cond=" tf.flag "]
		
		「何も入力されていない」場合以外にも、「半角/全角スペースのみ入力されている」場合、
		「Tabのみ入力されている」場合などをキャッチすることができます。
		*/
		
		; [cm] フリーレイヤーを解放します。
		[cm]
			
			; [emb] 変数をテキストとして出力するタグ。
			; [link]～[endlink] 囲まれたテキストをジャンプボタン化するタグ。
			あなたの名前は「[emb exp="f.player_name"]」でいいのね？[p]
			[link target="*Last_Commit"]【オッケー!!】[endlink][r]
			[link target="*Edit_Name  "]【ダメだ…】[endlink]
		
		; [s] ゲームを停止します。[link]の後には必ず使う必要があります。
		[s]
		
	; ------------------------------------------------------
	*Part2_Blank
		
		; --名前が空欄だったときに飛ばされるラベル。
		
			[cm]名前が空欄じゃないの。[l]
			ちゃんと書いてよねっ!![p]
		
		; [jump] 入力画面に戻します。
		[jump target="*Edit_Name"]
		
	; ------------------------------------------------------
	*Part2_Last
		
		; --名前を最終決定するラベル。
		
			[cm]これからよろしく!!　[emb exp="f.player_name"]さん。[p]
