	; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
	[set_default_view]
	
	
	
; == 21_macro.ks ===========================================
;
; 
;
; ★登場する主なタグ。
; [] … 

; ==========================================================
	
	
	
;-----------------------------------------------------------
*Start
;-----------------------------------------------------------
	
	[akn/def]
	サブルーチンとマクロの話をしよう。[p]
	サブルーチンとマクロはどちらも「複雑な処理を簡潔に記述するための機能」です。[p]
	もう少し詳しく言うと……。[p]
	「一連の複雑な処理に名前をつけておいて、その一連の処理を名前だけで使えるようにする機能」[p]
	……です。[p]
	
	
	
;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------
	
	[akn/dok]
	…………。[p]
	要領を得ないと思うので、具体例を出そう。[p]
	[akn/def]
	仮に、次のようなエフェクトを出すスクリプトを書いたとする。[p]
	
	[image name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
	[anim  name=macro_effect time=1000 left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
	[wa]
	[free  name=macro_effect layer=0]
	
	これは［image］［anim］［wa］［free］という一連のスクリプトでできているエフェクトだよ。[p]
	さて、
	
	[image name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
	[anim  name=macro_effect time=1000 left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
	[wa]
	[free  name=macro_effect layer=0]
	
	このエフェクトを出したい部分にいちいち
	
	[image name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
	[anim  name=macro_effect time=1000 left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
	[wa]
	[free  name=macro_effect layer=0]
	
	スクリプトをコピペしてもいいんだけど……。[p]
	見るからに冗長でしょ？……やってることは全部同じなのに。[p]
	こういうときに活用できるのが、サブルーチンやマクロ。[p]
	たとえばサブルーチンなら、シナリオの下のほうあるいは別のシナリオファイルに、[p]
	一連の処理を書いておく。[l]そのとき、ラベルと［return］タグを忘れないこと。[p]
	あとは、その一連の処理を呼び出したいところに［call］タグを置けば、
		
	[call target=*Sub_Effect]
	[call target=*Sub_Effect]
	[call target=*Sub_Effect]
	
	[er]このように、一発でエフェクトが出せる。[p]
	マクロの場合は［macro］～［endmacro］タグで一連の処理を定義してから、[p]
	
	[macro name=eff]
		[image name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
		[anim  name=macro_effect time=1000 left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
		[wa]
		[free  name=macro_effect layer=0]
	[endmacro]
	
	そのとき付けた名前をタグのように書けば、
	
	[eff]
	[eff]
	[eff]
	
	[er]同じように、一発でエフェクトが出せる。[p]
	……ね。[p]
	
	
	
;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------
	
	さて、サブルーチンやマクロを使ったとき、エンジン内部では何が起こってるのかを説明しよう。[p]
	まず［call］タグを踏むと、そこに帰還用の目印となる「旗」が立つ。[p]
	……この旗のことを「スタック」という。[p]
	それから、サブルーチンラベルに飛んでいって、そこでスクリプトが進行していき……[p]
	［return］タグを踏んだら、立てておいた「旗」のところに戻っくる。[p]
	そして、要らなくなった「旗」は捨てちゃう。[p]
	……ということが、エンジン内部では起こっています。[p]
	マクロのときも全く同じね。[p]
	
	
	
;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------
	
	さて、お互いに似たような機能を持つ、マクロとサブルーチンですが……。[p]
	機能的にはサブルーチンのほうがシンプルです。[p]
	サブルーチンは本当に「行って帰ってくる」以上の機能はないの。[p]
	だから説明することもこれ以上ないんだけど……その一方でマクロは高機能でね。[p]
	マクロにパラメータを渡して、そのパラメータをマクロ内で使う、なんてことができたりする。[p]
	ただしマクロはサブルーチンと違って、使う前に定義しておく必要があるので、注意してね。[p]
	
	マクロにパラメータを渡す例を見せよう!![p]
	time=%timeに着目してね。[p]
	こうすると、マクロ［eff2］に渡したtimeパラメータを［anim］に流用できるわけ。[p]
	いくよ。[l]
	
	[macro name=eff2]
		[image               name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
		[anim  time=%time    name=macro_effect left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
		[wa]
		[free                name=macro_effect layer=0]
	[endmacro]
	
	[eff2 time=250]
	[eff2 time=500]
	[eff2 time=1000]
	[eff2 time=2000]
	
	[er]……このとおり。[p]
	time属性を指定できるようにしたうえで、さらに「time属性が指定されなかったときの値」……[p]
	いわゆる「デフォルト値」を設定することもできる。[p]
	
	[macro name=eff3]
		[image                    name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
		[anim  time=%time|1500    name=macro_effect left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
		[wa]
		[free                     name=macro_effect layer=0]
	[endmacro]
	
	[eff3 time=500]
	[eff3]
	[eff3 time=500]
	[eff3]
	
	time属性が指定されかったら1500ミリ秒待つ、というのが伝わるかな？[p]
	また、これは高度なテクニックだけど……。[p]
	マクロに渡されたパラメータに、JavaScript式でアクセスすることもできる。[p]
	たとえば……マクロに渡されたtimeパラメータにアクセスするには、「mp.time」とすればいい。[p]
	これと「&」記号を使えば、
	
	[macro name=eff4]
		[image                    name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
		[anim  time=&mp.time      name=macro_effect left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
		[wa]
		[free                     name=macro_effect layer=0]
	[endmacro]
	
	[eff4 time=250]
	[eff4 time=500]
	[eff4 time=1000]
	[eff4 time=2000]
	
	このように、やはりマクロにパラメータを渡せるようにできる。[p]
	
	
	
;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------
	
	……ふふ。[p]
	いま見てもらったとおり、サブルーチンやマクロを使えば、記述がとても簡潔になる。[p]
	何より、仕様変更に対応しやすい。[p]
	
	[macro name=strong]
		[font edge=blue]
	[endmacro]
	
	たとえば、文字を強調するために［strong］マクロを定義したとしよう。[p]
	[strong]このマクロを使うと、文字がこのように青色の縁取りで強調される。[p]
	[resetfont]しかしあるとき、あなたは気まぐれに「やっぱり黄色にしよう」と思うかもしれない。[p]
	そのとき、もしマクロを使わずに直に［font］などのタグで強調していると、修正が大変!![p]
	でも［strong］マクロを使っていれば、修正するのは［strong］マクロの定義内容だけで済むの。[p]
	定義内容を変えれば、［strong］マクロを使っているところが全部変わるからね。[p]
	
	以上、サブルーチンとマクロの説明でした。[p]
	サブルーチンとマクロにはいろんな利点があるので、ぜひ積極的に使ってみてー!![p]
	
	
	
;-----------------------------------------------------------
*End
;-----------------------------------------------------------
	
	; [jump] 目次画面にジャンプします。
	[jump storage="select.ks"]
	
	
	
	;-------------------------------------------------------
	*Sub_Effect
		
		[image name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
		[anim  name=macro_effect time=1000 left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
		[wa]
		[free  name=macro_effect layer=0]
		
	[return]