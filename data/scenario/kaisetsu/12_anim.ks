	; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
	[set_default_view]
	
	
	
; == 12_anim.ks ============================================
;
; オブジェクトを動かす方法のまとめです。
;
; ★登場する主なタグ。
; [anim]        … オブジェクトを動かします。
; [chara_move]  … キャラクターオブジェクトを動かします。
; [quake]       … 画面を揺らします。
; [kanim]       … 定義しておいたキーフレームアニメーションを適用します。
; [keyframe]    … キーフレームアニメーションの定義を始めます。
; [endkeyframe] … キーフレームアニメーションの定義を終わります。
; [frame]       … キーフレームを定義します。

; ==========================================================
	
	
	
;-----------------------------------------------------------
*Start
;-----------------------------------------------------------
	
		[akn/def]
		ティラノスクリプトは強力なアニメーション機能をサポートします。[p]
		いままで説明してきたすべてのオブジェクトが、アニメーションに対応しているよ。[p]
		
	[image name=obj_image layer=1 x=150 y=200 storage=05_image_B.png]
	[ptext name=obj_ptext layer=1 x=600 y=270 size=40 text=文字オブジェクト"]
	
	
	
;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------
	
		いくつかあるアニメーション関連のタグのうち、［anim］から見てみよう。[p]
	
	
	
	; ●
	; ● 基本的な使用例。
	; ●
	
	[anim  name=obj_ptext top=120 time=700]
	[anim  name=obj_ptext top=420 time=700]
	[anim  name=obj_ptext top=270 time=700]
	[wa]
	
	[anim  name=obj_image width=300 time=700]
	[anim  name=obj_image width=0   time=700]
	[anim  name=obj_image width=200 time=700]
	[wa]
	
	
	
	; ●
	; ● 相対的に指定する例。
	; ●
		
		このタグは基本的に最終的な位置やサイズを絶対指定するんだけど、[p]
		特殊な記法を使えば「今いる場所からいくら」という相対的な指定の仕方もできる。[p]
		
	[anim  name=obj_image top="-=100" time=700]
	[anim  name=obj_image top="+=200" time=700]
	[anim  name=obj_image top="-=100" time=700]
	[wa]
	
	
	
	; ●
	; ● [wa] を使わず、アニメーションさせながらメッセージを進行する例。
	; ●
	
	
	[anim  name=obj_image width=300 time=700]
	[anim  name=obj_image width=0   time=700]
	[anim  name=obj_image width=200 time=700]
	[anim  name=obj_image top="-=100" time=700]
	[anim  name=obj_image top="+=200" time=700]
	[anim  name=obj_image top="-=100" time=700]
		
		ちなみに、今使っている、アニメーションの完了を待機するタグ［wa］を削除すれば、[p]
		アニメーションと同時にメッセージを進行させることもできる。[l]
	
	[wa]
	[er]
	
	
	
	; ●
	; ● レイヤー下のオブジェクトを丸ごと指定する例。
	; ●
		
		また、アニメーションの対象とするオブジェクトはname属性で指定するのが基本だけど、[p]
		「特定のレイヤー下のオブジェクト」をまるごと対象にとることもできる。[p]
		
	[anim  layer=1 top="-=200" opacity=0 time=700]
	[wa]
	[freeimage layer=1]
		
		[akn/hap]
		このあたりのワザについてはタグリファレンスも見てみてね。[p]
	
	
	
	; ●
	; ● 領域外のオブジェクトを画面内に引っ張ってくる例。
	; ●
		
		[akn/def]
		「最初は画面領域外に出しておいて、あとからそれを画面内に引っ張ってくる」こともできる。[p]
	
	[glink x=1320 y=100 width=200 text=次に進む target=*Part2 color=red name=glink1]
	[glink x=1320 y=200 width=200 text=次に進む target=*Part2 color=red name=glink2]
	[glink x=1320 y=300 width=200 text=次に進む target=*Part2 color=red name=glink3]
	
	[anim name=glink1 time=300 left="-=1000"]
	[wait time=100]
	[anim name=glink2 time=300 left="-=1000"]
	[wait time=100]
	[anim name=glink3 time=300 left="-=1000"]
	[s]
	
	
	
;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------
	
		キャラクターオブジェクトを対象とするアニメーションについては、専用のタグもある。[p]
		[akn/dok]
		それは何かというと［chara_move］タグだ!![p]
		このタグを使えば、キャラクターをいったん退場させてから位置を変えて再登場――[p]
		みたいな処理はしなくてよくなる。[p]
	
	; ●
	; ● キャラクター専用のアニメーションタグ[chara_move]の例。
	; ●
	
	[chara_move name=akane time=1000 left=40  top=40 width=600 ]
	[chara_move name=akane time=1000 left=340 top=40           ]
	[chara_move name=akane time=1000 left=280 top=40 width=400 ]
	[wa]
		
		[akn/def]
		ね!![p]
	
	
	
;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------
	
		[akn/def]
		特定のオブジェクトを操作するものではないけど「画面全体を振動させる」タグもあるよ。[p]
		［quake］タグがそれで、実際に使ってみると、こんなふうです。[p]
	
	; ●
	; ● 縦揺れの例。
	; ●
	
	[quake time=1000]
	
	; ●
	; ● 横揺れの例。
	; ●
	
		横揺れも。[p]
	
	[quake time=300 vmax=0 hmax=10 count=8]
	
	
	
;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------
	
		[akn/dok]
		さて、［anim］とはべつに［kanim］というタグもあって……。[p]
		こちらはかなり複雑なアニメーションができるよ![p]
		[akn/def]
		キーフレームアニメーションというものでね。[p]
		あらかじめ「どう動くか」を定義しておいてからそれを適用する、といった手順を踏みます。[p]
		実際に使ってみると、
	
	[keyframe name=my_anim2]
		[frame p=25%  x=50  ]
		[frame p=75%  x=-100]
	[endkeyframe]
	
	[kanim name=akane keyframe=my_anim2 time=700]
	[wa]
	[stop_kanim name=akane]
	
		[akn/hap]
		こんなふうに動かせる。[p]
		いまのは1回再生だったけど、リピートする回数を指定することもできる。[p]
	
	
	[kanim name=akane keyframe=my_anim2 time=700 count=3]
	[wa]
	[stop_kanim name=akane]
	
	
		[akn/def]
		［anim］タグに比べると、より滑らかに、多数の項目をアニメーションさせることが可能です。[p]
	
	
	[keyframe name=my_anim]
		[frame p=0%   scale=1   rotate=0deg   opacity=1]
		[frame p=25%                          opacity=0]
		[frame p=50%  scale=1.5               opacity=1]
		[frame p=75%            rotate=360deg          ]
		[frame p=100% scale=1                          ]
	[endkeyframe]
	
	[kanim name=akane keyframe=my_anim]
	[wa]
	[stop_kanim name=akane]
	
	
	
		このへんは「サンプルテクニック集②」に詳しい情報を載せているので、[p]
		[akn/hap]
		そちらをチェックしてもらえると嬉しいな!![l]
	
	[wa]
	[er]
	
	
	
;-----------------------------------------------------------
*End
;-----------------------------------------------------------
	
	; [jump] 目次画面にジャンプします。
	[jump storage="select.ks"]