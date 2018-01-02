	; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
	[set_default_view]
	
	
	
; == 05_image.ks ===========================================
;
; 画像オブジェクトについて学びます。
;
; ★登場する主なタグ。
; [image] … 指定レイヤーに画像オブジェクトを出します。
;
; ==========================================================
	
	
	
;-----------------------------------------------------------
*Start
;-----------------------------------------------------------
	
		; [akn/def] 独自マクロ。あかねの表情を変えます。似た名前のタグも同様に独自マクロです。
		[akn/def]ここでは「画像オブジェクト」を出す方法について説明しよう![p]
		「オブジェクト」というのは、レイヤー上に出す「モノ」……。[p]
	
	; [image] 画像オブジェクトを出します。
	[image layer="1" x="0" y="0" storage="05_image_A.png" time="700"]
		
		たとえば、私は「キャラクターオブジェクト」、名前欄の文字は「文字オブジェクト」です。[p]
		それぞれのレイヤーにはいろんなオブジェクトが乗っかっているわけだね。[p]
	
	; [freeimage] レイヤーを解放します。
	[freeimage layer="1" time="700"]
	
	
	
;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------
	
	; ●
	; ●もっともシンプルな例。
	; ●
	
		オブジェクトにもいろいろあるけれど……まずは基本的な「画像オブジェクト」について。[p]
		[akn/hap]指定したレイヤーに画像オブジェクトを出すには［image］タグを使おう!![p][akn/def]
		
	; [image] 画像オブジェクトを出します。
	[image layer="1" x="150"  y="150" storage="05_image_B.png"]
		
		じゃん![p]
		前景レイヤー1番に画像を出してみましたー。[p]
		レイヤーとXY座標のみを指定した、一番簡単な例だよ。[p]
		
	; ●
	; ●消し方について。
	; ●
		
		消すときにはどうすればいいかというと、[p]
		レイヤーに乗っかっているオブジェクトをすべて削除するタグがあって、それが［freeimage］。[p]
		……削除することを「解放する」なんていったりもする。[p]
		じゃあ、前景レイヤー1番を解放してみよう。[p]
	
	; [freeimage] レイヤーを解放します。
	[freeimage layer="1"]
		
		[akn/hap]どん!![p]
		[akn/def]解放したよ。[p]
		……以上が、もっともシンプルな画像オブジェクトの「出し方」および「消し方」です。[p]
	
	
	
;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------
	
	; ●
	; ●横幅と高さについて。
	; ●
	
		このタグで画像オブジェクトを出す際には、画像の「幅」と「高さ」を自由に指定できるよ。[p]
		単位はピクセルね。[p]
		実際に出してみよう。[p]
	
	[image layer="1" x=" 80"  y="150" storage="05_image_B.png"]
	[image layer="1" x="330"  y="150" storage="05_image_B.png" width="300"]
	[image layer="1" x="740"  y="150" storage="05_image_B.png" width="100" height="400"]
		
		ほい!……左から順に、[l]
		
	[ptext layer="1" text="未指定(原寸)"   x=" 80" y="110" edge="0x000000" size="32"]
		
		なにも指定しない、[l]
		
	[ptext layer="1" text="幅のみ指定"     x="330" y="110" edge="0x000000" size="32"]
		
		幅のみ指定、[l]
		
	[ptext layer="1" text="幅も高さも指定" x="670" y="110" edge="0x000000" size="32"]
		
		幅も高さも指定、です。[p]
		何も指定しなければ、もとの画像サイズそのままで表示されるよ。[p]
		幅のみ……あるいは高さのみ指定した場合、指定しなかったほうは自動で調整される。[p]
		どちらも指定した場合、そのとおりの画像サイズで表示することができるの。[p]
		
	[freeimage layer="1" time="700"]
	
	
;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------
	
	; ●
	; ●フェードインと待機について。
	; ●
	
		このタグは基本的に、「瞬時に」オブジェクトを出すものなんだけど……。[p]
		timeパラメータを指定すれば、「時間をかけて」オブジェクトを出すことができる。[p]
		
	[image layer="1" x="130"  y="150" storage="05_image_B.png" time="700"]
	[image layer="1" x="380"  y="150" storage="05_image_B.png" time="700"]
	[image layer="1" x="630"  y="150" storage="05_image_B.png" time="700"]
		
		……このとおり。[p]
	
	[freeimage layer="1" time="700"]
		
		しかしこうなると、画像を表示しおわるまでの間、次に進まなくなる。[p]
		画像を表示しながら次のスクリプトに進んでほしい場合は、さらにwaitパラメータを指定しよう。[p]
		
	[image layer="1" x="130"  y="150" storage="05_image_B.png" time="700" wait="false"]
	[image layer="1" x="380"  y="150" storage="05_image_B.png" time="700" wait="false"]
	[image layer="1" x="630"  y="150" storage="05_image_B.png" time="700"]
		
		そうすれば、同時に表示することもできるよ!![p]
		
	[freeimage layer="1" time="700"]
	
	
	
;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------
	
	; ●
	; ●重なりの順番を指定する。
	; ●
	
		さて……ひとつのレイヤーに画像オブジェクトを複数出した場合の「重なりの順序」について。[p]
		これはどうかというと……。[p]
		
	[image layer="1" x=" 80"  y=" 80" width="200" storage="color/col1.png" time="700"]
	[image layer="1" x="140"  y="140" width="200" storage="color/col3.png" time="700"]
	[image layer="1" x="200"  y="200" width="200" storage="color/col5.png" time="700"]
		
		このように「後から出したものが上に乗っかる」よ。[p]
	
	[freeimage layer="1" time="700"]
		
		[akn/hap]まあ、それが自然だよね。[p]
		[akn/def]けれど、zindexパラメータを指定することで、重なりの順序を自由に操作することもできる。[p]
		
	[image layer="1" x=" 80"  y=" 80" width="200" storage="color/col1.png" time="700" zindex="3"]
	[image layer="1" x="140"  y="140" width="200" storage="color/col3.png" time="700" zindex="1"]
	[image layer="1" x="200"  y="200" width="200" storage="color/col5.png" time="700" zindex="2"]
		
		ほら、さっきとは重なり方が違うでしょ。[p]
		zindexに指定した数が大きいほうが上に乗っかるんだよ～。[p]
		
	[freeimage layer="1" time="700"]
	
	
	
;-----------------------------------------------------------
*Part5
;-----------------------------------------------------------
	
	; ●
	; ●名前を割り当てて個別に管理する。
	; ●
	
		また、オブジェクトには名前をつけることができる。[p]
		……nameパラメータだね。[p]
		これはひとつひとつのオブジェクトを区別・分類するためのものなの。[p]
		
	[image layer="1" x="130"  y="150" storage="05_image_B.png" name="A"]
	[image layer="1" x="380"  y="150" storage="05_image_B.png" name="B"]
	[image layer="1" x="630"  y="150" storage="05_image_B.png" name="B"]
	
		これを指定しておくことで、オブジェクトを個別に操作することができるよ。[p]
	
	[free layer="1" name="A"]
	
		ほい、[l]
	
	[free layer="1" name="B"]
	
		ほいと。[p]
		
	[image layer="1" x="130"  y="150" storage="05_image_B.png" name="C,A"]
	[image layer="1" x="380"  y="150" storage="05_image_B.png" name="C,B"]
	[image layer="1" x="630"  y="150" storage="05_image_B.png" name="C,B"]
		
		ちなみに、ひとつのオブジェクトに対して複数の名前をつけることもできます。[p]
	
	[free layer="1" name="C"]
	
		……こんなふうにね。[p]
	
	
	
;-----------------------------------------------------------
*Part6
;-----------------------------------------------------------
	
	; ●
	; ●横位置をキーワードで指定する。
	; ●
		
		……。[p]
		最後に、これは豆知識的な話なんだけど……。[p]
		[akn/hap]画像オブジェクトの横の位置は、数値ではなく「キーワード」で指定することもできるのだ![p]
		[akn/def]これはあらかじめConfig.tjsで独自に数値を割り当てておくもので――[p]
		「left」「left_center」「center」「right_center」「right」の五つがあるよ。[p]
		このキーワードを使って画像を出してみると、[p]
	
	[image layer="1" pos="l"  y="170" storage="05_image_B.png" width="160"]
	[image layer="1" pos="lc" y="150" storage="05_image_B.png" width="160"]
	[image layer="1" pos="c"  y="170" storage="05_image_B.png" width="160"]
	[image layer="1" pos="rc" y="150" storage="05_image_B.png" width="160"]
	[image layer="1" pos="r"  y="170" storage="05_image_B.png" width="160"]
	
		こんなふうにできる。[p]
	
	[ptext layer="1" text="left"          x=" 40" y="330" edge="0x000000" size="20" align="center" width="160"]
	[ptext layer="1" text="left_center"   x="220" y="120" edge="0x000000" size="20" align="center" width="160"]
	[ptext layer="1" text="center"        x="400" y="330" edge="0x000000" size="20" align="center" width="160"]
	[ptext layer="1" text="right_center"  x="580" y="120" edge="0x000000" size="20" align="center" width="160"]
	[ptext layer="1" text="right"         x="760" y="330" edge="0x000000" size="20" align="center" width="160"]
		
		キーワードはご覧の通り。[p]
		[akn/hap]便利機能のひとつとして覚えておくといいかも？[p]
	
	
	
;-----------------------------------------------------------
*End
;-----------------------------------------------------------
	
	; [jump] 目次画面にジャンプします。
	[jump storage="select.ks"]