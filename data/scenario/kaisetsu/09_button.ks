	; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
	[set_default_view]
	
	; [akn/def] 独自マクロ。キャラ名欄に「あかね」と入れつつ、あかねの表情を変えます。定義は「macro.ks」で。
	[akn/def]
	
	
	
; == 09_button.ks ==========================================
;
; プレイヤーにクリック（タップ）してもらうことでシナリオをジャンプさせるオブジェクト
; 「ボタンオブジェクト」についての説明をします。
;
; ★登場する主なタグ。
; [button] … ボタンオブジェクトを出します。ボタンオブジェクトはフリーレイヤーに出ます。
;
; ==========================================================
	
	
	
;-----------------------------------------------------------
*Start
;-----------------------------------------------------------
		
		ボタンオブジェクトについて説明しよう。[p]
		ボタンオブジェクトというのは――[p]
		プレイヤーにクリック（タップ）してもらうことで、シナリオをジャンプさせる装置のことだよ。[p]
		「画像ボタン」と「文字ボタン」があるけれど、ここでは「画像ボタン」について見てみよう。[p][akn/hap]
		
		
		
;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------
		
		; ●
		; ●基本的な画像ボタンオブジェクト。
		; ●
		
		画像ボタンオブジェクトを出すタグは［button］。[p]
		これを使ってさっそく出してみるから、クリックして読み進めてください。[l]
		
	; [button] もっとも基本的なボタンオブジェクトを出します。
	[button target=*Part2 x=145 y=195 graphic=09_button_A1.png]
		
	; [s] ゲームを停止させます。ボタンを出した後に必ず配置します。
	; ゲーム停止させないと、ボタンが押せるようになりません。
	[s]
		
		
		
;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------
		
	; [cm] フリーレイヤーを解放します。
	[cm]
		
		[akn/def]
		クリックしてくれたね。[p]
		こういう装置です。[p]
		ノベルゲームでは、タイトル画面や選択肢の演出に使うことが多くなるでしょう。[p]
		
		ボタンオブジェクトは「フリーレイヤー」という特殊なレイヤーに配置されるんだけど――[p]
		フリーレイヤーにオブジェクトがある状態では、シナリオを読み進めることができないので、[p]
		ボタンでジャンプした先には、フリーレイヤーを解放するタグである［cm］を必ず置いてね。[p][akn/dok]
		……画像ボタンは勝手には消えないので。[p][akn/def]
		
		
		
;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------
		
		; ●
		; ●ヒントが出るボタン。
		; ●
		
		……よし。[p]
		じゃあ、このボタンにオプションを盛っていって豪華なボタンにしてみよう。[p]
		まずは「マウスを乗せて数秒待ったときに小さな説明文が出るボタン」に改造だ!![l]
		
	; [button] hintパラメータを指定したボタン。
	[button target=*Part4 hint=ボタンオブジェクト～。 x=145 y=195 graphic=09_button_A1.png]
	[s]
		
		
		
;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------
		
		[cm]
		
		; ●
		; ●画像が切り替わるボタン。
		; ●
		
		確認できたかな？[p]
		どんどんいくよ。[p]
		「マウスを乗せたりクリックしたりしたときに、画像が変わるボタン」。[l]
		
	; [button] enterimg、clickimgパラメータを指定したボタン。
	[button target=*Part5 enterimg=09_button_A2.png clickimg=09_button_A3.png hint=ボタンオブジェクト～。 x=145 y=195 graphic=09_button_A1.png]
	[s]
		
		
		
;-----------------------------------------------------------
*Part5
;-----------------------------------------------------------
		
	; [wait] 即座に[cm]してしまうとclickimgが見えないので、見えるようにするために300ミリ秒待ちます。
	[wait time=300]
	[cm]
		
		; ●
		; ●音が鳴るボタン。
		; ●
		
		……変わったでしょ？[p]
		音もつけちゃおう!![p]
		「マウスを乗せたり離したりクリックしたりしたときに音が鳴るボタン」。[l]
	
	; [ptext] クレジット表記。音声素材は「Music is VFR」より。
	[ptext layer="1" x="5" y="0" size="40" edge=black color=white text="効果音素材：Music&ensp;is&ensp;VFR" name="credit"]
	
	; [button] enterse、leavese、clickseパラメータを指定したボタン。
	[button target=*Part6 enterse=09_button_1.ogg leavese=09_button_2.ogg clickse=09_button_3.ogg enterimg=09_button_A2.png clickimg=09_button_A3.png hint=ボタンオブジェクト～。 x=145 y=195 graphic=09_button_A1.png]
	[s]
		
		
		
;-----------------------------------------------------------
*Part6
;-----------------------------------------------------------
		
	[free layer=1 name=credit]
	[wait time=300]
	[cm]
		
		; ●
		; ●登場＆退場アニメーションつきのボタン。
		; ●
		
		[akn/hap]
		音があると、とても楽しげになるでしょ。[p][akn/def]
		……ボタンオブジェクトも、他のオブジェクト同様に個別に名前をつけることができて、[p]
		その名前をアニメーションタグの対象にとることができます。[p]
		「登場＆退場アニメーションのついたボタン」。[l]
		
	; [keyframe]～[endkeyframe]x2 登場、退場アニメーションを定義します。
	[keyframe name=ZoomIn]
	  [frame p=0%   scale=0 y=-15 opacity=0]
	  [frame p=100% scale=1 y=0   opacity=1]
	[endkeyframe]
	[keyframe name=ZoomOut]
	  [frame p=0%   scale=1 y=0   opacity=1]
	  [frame p=100% scale=2 y=-15 opacity=0]
	[endkeyframe]
		
	[button target=*Part7 name=Button enterse=09_button_1.ogg leavese=09_button_2.ogg clickse=09_button_3.ogg enterimg=09_button_A2.png clickimg=09_button_A3.png hint=ボタンオブジェクト～。 x=145 y=195 graphic=09_button_A1.png]
	; [kanim][wa] 登場キーフレームアニメーションを適用→その完了を待ちます。
	; この処理を[button]～[s]に挟むことで、登場アニメーションをつけられるということです。
	[kanim keyframe=ZoomIn name=Button time=1000]
	[wa]
	[s]
		
		
		
;-----------------------------------------------------------
*Part7
;-----------------------------------------------------------
	
	; [kanim][wa] 退場キーフレームアニメーションを適用→その完了を待ちます。
	[kanim keyframe=ZoomOut name=Button time=250]
	[wa]
	[cm]
		
		; ●
		; ●JavaScriptを実行するボタン。
		; ●
		
		[akn/hap]
		もうめちゃめちゃ豪華だね!![p][akn/def]
		最後に機能的なオプションも紹介しておこう。[p]
		ボタンオブジェクトは、単に特定のラベルにジャンプするだけじゃなくて――[p]
		「ジャンプするときに指定されたJavaScript式を実行する機能」もあるのだ。[p]
		これを使って、ボタンごとに違う値を変数に格納することができる。[l]
		
	; [button]x2 expパラメータを指定した例。
	; ボタンをクリックした瞬間、変数f.aに文字列「青」または「赤」が入ります。
	[button target=*Part8 exp=" f.a = '青' " x=145 y=195 graphic=09_button_A1.png]
	[button target=*Part8 exp=" f.a = '赤' " x=675 y=195 graphic=09_button_B1.png]
	[s]
		
		
		
;-----------------------------------------------------------
*Part8
;-----------------------------------------------------------
		
	[cm]
		
		私にはわかったよ……
		
	; [emb] 変数f.aの中身をメッセージとして取り出します。
	; 上記のボタンによって、いまf.aには「赤」または「青」が入っているはずです。
	[emb exp=f.a]
		
		色のボタンを押したね!![p]
		……ふう。[p][akn/dok]
		以上、画像ボタンの説明でした。[p]
		実は［button］タグでは、「固定ボタン」という特殊なボタンも作れるんだけど、[p][akn/def]
		別の話になってくるので、この節はこれで終わるよ。[p]
		
		
		
;-----------------------------------------------------------
*End
;-----------------------------------------------------------
	
	; [jump] 目次画面にジャンプします。
	[jump storage="select.ks"]