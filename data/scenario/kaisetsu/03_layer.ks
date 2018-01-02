	; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
	[set_default_view]
	
	
	
; == 03_layer.ks ===========================================
;
; 
;
; ★登場する主なタグ。
; [trans]   … レイヤーの裏の状態を表にトランジションします。
; [wt]      … トランジションの完了を待機します。
; [backlay] … レイヤーの表の情報を即座に裏にコピーします。

; ==========================================================
	
	
	
;-----------------------------------------------------------
*Start
;-----------------------------------------------------------
	
		; [akn/def] 独自マクロ。あかねの表情を変えます。似た名前のタグも同様に独自マクロです。
		[akn/def]
		レイヤー、という概念について学んでみよう。[p]
		ティラノスクリプトの画面は、いくつかの「層」が重なってできているの。[p]
		その「層」のことをレイヤーといって――[p]
		たとえば「ベースレイヤー」「前景レイヤー」「メッセージレイヤー」などがあるわ。[p]
	
	
	
;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------
	
	; ★
	; ★実際に見てみよう。
	; ★
	
		じゃあ、実際に画像で見てみよう!![p]
	
	; [image] 画像を出す。
	[image layer="2" page="fore" name="image" storage="03_layer_A.png" y="100" time="700"]
		
		仮に、こういうゲーム画面があるとするよね。[p]
		このとき、ゲーム画面の層の重なりはどうなっているかというと……。[p]
	
	; [image] 前景レイヤー2番【裏】に画像を出す。
	[image layer="2" page="back" name="image" storage="03_layer_B.png" y="100" time="0"]
	
	; [trans] 前景レイヤー2番に対してトランスを実行。【裏】を【表】にもってくる。
	[trans layer="2" method="fadeInRight" time="700"]
	
	; [wt] トランスの完了を待つ。
	[wt]
	
		こういう層の重なりになってるんだ。[p]
		それぞれ何レイヤーかというと……。[p]
	
	; [ptext]x4 文字オブジェクトを前景レイヤー2番に時間をかけて表示する。
	[ptext layer="2" x=" 10" y="345" text="ベースレイヤー"     size="24" align="center" width="240" time="700"]
	[ptext layer="2" x="250" y="345" text="前景レイヤー"       size="24" align="center" width="240" time="700"]
	[ptext layer="2" x="480" y="345" text="メッセージレイヤー" size="24" align="center" width="240" time="700"]
	[ptext layer="2" x="720" y="345" text="フィックスレイヤー" size="24" align="center" width="240" time="700"]
		
		この通り!![p]
		さらに、選択肢ボタンなどが配置される「フリーレイヤー」なんていうのもあるわ。[p]
		また、前景レイヤーとメッセージレイヤーはさらに複数枚のレイヤーに分かれるよ。[p]
		……。[p]
	
	
	
;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------
	
	; ★
	; ★重なりの順番が決まっている。
	; ★
		
		……さて。[p]
		レイヤーについて、重要なポイントひとつめ。[p]
		それぞれのレイヤーには[<y]重なりの順番が決まっています[>]。[p]
		上の図で見ると、レイヤーは右側のほうが前面に出てくるように重なるよ。[p]
		これはもう、そういう決まり。[p]
		だから、メッセージレイヤーの上に前景レイヤーを持ってくる――とかいうことはできないの。[p]
		まずここを抑えてね。[p]
		
	; [freeimage] 前景レイヤー2番を解放する。
	[freeimage layer="2" time="700"]
	
	
;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------
	
	; ★
	; ★表示/非表示の状態がある。[layopt]で変更可能。
	; ★
		
		また、レイヤーには[<y]表示・非表示の状態[>]があって――[p]
		[<y]その状態は［layopt］タグで変更できる[>]から、[r]チェックしておいてね。[p]
		絵が映らない!! なんで～!?ってときは、レイヤー自体が非表示になっていることも多いよ。。。[p]
		たとえば、私はいま「前景レイヤー0番」にいるんだけど、このレイヤーを……。[p]
		
	[layopt layer="0" visible="false"]
	
		えいっ!!　非表示状態にしてみたよ。[p]
		……消えたでしょ？[p]
	
	[layopt layer="0" visible="true"]
	
		今度は、表示状態に。[p]
		……ね!![p]
	
	
	
;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------
	
	; ★
	; ★裏表の概念がある。[trans]で入れ替え可能。
	; ★
		
		それから、ここが難しいところなんだけど……。[p]
		フリーレイヤーとフィックスレイヤー以外のすべてのレイヤーには[<y]裏と表の概念[>]があるの。[p]
		プレイヤーに見えているのは常に表側なんだけど――[p]
		実はプレイヤーに見えない「裏側」がある。[l]それを利用すれば、[p]
		レイヤーの裏側にこっそり絵を描いておいてから、それを表側に引っぱり出す……[p]
		なんてこともできます。[p]
		レイヤーの裏側の状態を表側に引っぱり出すタグが［trans］だよ。[p]
		イメージ的には……[l]アレだ!![p]
		「回転するホワイトボード」!![p]
		ホワイトボードの裏面に文字を書いてからバーンとひっくり返すのを想像するといいかも。[p]
		いま実際にやってみるよ？[p]
	
	[image layer="1" page="back" x="130"  y="150" storage="05_image_B.png"]
	[image layer="1" page="back" x="380"  y="150" storage="05_image_B.png"]
	[image layer="1" page="back" x="630"  y="150" storage="05_image_B.png"]
	
		……前景レイヤー1番の「裏側」にお絵かき中。[p]
		「裏側」だから、あなたには見えてないね。[p]
		そしてそれを――[l]
	
	[trans layer="1" time="1000" method="rotateIn"]
		
		表に持ってくる!![p]
		こういうことです。[p]
		関連するタグに［wt］［backlay］があるので、余裕のある人はタグリファレンスを見てね。[p]
		
		以上、レイヤーのお話でした。[p]
		最後はちょっと難しかったかな。。。[p]
	
	
	
;-----------------------------------------------------------
*End
;-----------------------------------------------------------
	
	; [jump] 目次画面にジャンプします。
	[jump storage="select.ks"]