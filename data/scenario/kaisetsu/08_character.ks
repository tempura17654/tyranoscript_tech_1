	; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
	[set_default_view]
	
	
	
; == 08_character.ks =======================================
;
; キャラクター操作について学習する。
;
; ★登場する主なタグ。
; [chara_new]       … キャラクターを定義する。
; [chara_face]      … 定義してあるキャラクターに表情を追加する。
; [chara_delete]    … キャラクターの定義を削除する。。
; [chara_show]      … 定義してあるキャラクターをオブジェクトとして表示する。
; [chara_mod]       … 表示しているキャラクターオブジェクトの表情を変更する。
; [chara_hide]      … 表示しているキャラクターオブジェクトを解放する。
; [chara_hide_all]  … 表示しているキャラクターオブジェクトをすべて解放する。
; [chara_ptext]     … キャラクターの名前欄として扱うべき文字オブジェクトを指定する。
; [chara_config]    … キャラクター操作にまつわる各種設定を行う。

; ==========================================================
	
	
	
;-----------------------------------------------------------
*Start
;-----------------------------------------------------------
	
		[akn/hap]……説明しよう!![p]
		[akn/def]「キャラクターオブジェクト」というのは……[r]いままさに!! あなたの目の前にいる私のことだ!![p]
		私は「前景レイヤー0番」の上に乗っかっているキャラクターオブジェクトなのです。[p]
		[akn/dok]ただの画像オブジェクトだと思ったら、大間違いだぜ!![p]
		[akn/def]キャラクターオブジェクトは、画像オブジェクトに「便利な機能」が山ほどついたものなの。[p]
		具体的には「画像の切り替え」「自動位置調整」「自動強調表現」などの機能がついてるよ。[p]
		[akn/hap]だから、キャラクターの立ち絵はぜひとも「キャラクターオブジェクト」で管理しよう!![p]
		
	
	
;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------
	
		[akn/def]それでは……。[p]
		キャラクター関連のタグを豊富に使った「寸劇」を見てもらおうかな。[p]
		この「寸劇」では、キャラクター関係のタグ以外のタグはほとんど使ってないよ。[p]
		また、キャラクターがしゃべる度に明るさが変わったりキャラクターが動いたりするけれど、[p]
		そういうのは全部自動です。システムが勝手にやってくれます。[p]
		では、どうぞ。[p]
		
	[chara_config talk_focus="brightness" memory="true" time="0"]
	[chara_new   name="tyrano" jname="？？？" storage="chara/mascot_1/normal.png" ]
	[chara_face  name="tyrano"  face="happy"  storage="chara/mascot_1/happy.png"  ]
	[chara_face  name="tyrano"  face="angry"  storage="chara/mascot_1/angry.png"  ]
	[chara_show  name="tyrano" zindex="10"]
	
	#tyrano
		がおーーー!![p]
		
	#akane:doki
		な、なになに？　あなたはだれ？[p]
	
	#tyrano:happy
		がおがおーーーーー!!![p]
		
	
	#akane
		何を言っているのかさっぱりわからない……。[p]
		これじゃ名前もわからないわ……。[p]
		じゃあ……仮に「ティラ乃」ちゃんということにしておこうかな。[p]
		……いい？[p]
	
	[iscript]
		TYRANO.kag.stat.charas['tyrano'].jname = 'ティラ乃'
	[endscript]
	#tyrano:default
		が～～!![p]
	
	#akane:default
		通じてるのかな……かわいいわね。[p]
	
	#
		――ガラガラガラ。[p]
	
	[chara_show  name="yamato" top="30"]
	#yamato
		おっすー。[p]
	
	#yamato:angry
		やや、なんだこれ。ぬいぐるみか？[p]
	
	[chara_config talk_anim="up" talk_anim_time="150"]
	[chara_mod name="tyrano" reflect="true"] 
	#tyrano:angry
		[font size="100"]がうがう!!![p]
	
	#yamato:tohoho
		うおっ!!!![p][resetfont]
	[chara_move name="yamato" left="-=80" anim="true" wait="false" time="200"]
		おいっ、あかねっ! なんなんだよこいつは!![p]
	
	[chara_mod name="tyrano" face="default"]
	[chara_config talk_anim="none"]
	#akane:angry
		その子はティラ乃ちゃんよ。[p]
		こいつなんて言わないで!![p]
	
	#yamato
		……てぃらの？　んだ、そりゃ……。[p]
	
	#akane:angry
		……いいわ、私たちはあっちでお話ししてよう。ね、ティラ乃ちゃん。[p]
	
	[chara_mod name="tyrano" reflect="false"] 
	#tyrano:default
		がお～。[p]
	
	[chara_hide name="akane" wait="false" pos_mode="false"]
	[chara_hide name="tyrano"]
	
	#yamato:default
		マジでなんなんだあれ……[p]
				
	[chara_show name="akane"]
	#akane
		「あれ」じゃなくてティラ乃ちゃん!![p]
		やまともちょっとこっちに来なさい!![p]
	
	#yamato:tohoho
		いや、いいけどよ……。[p]
	
	[chara_config talk_focus="none" memory="false" talk_anim="down"]
	[chara_hide_all]
	
	#３人
		（ぺちゃくちゃぺちゃくちゃ）[p]
	
	
	
;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------
	
	[chara_show name="akane"  wait="false"]
	[chara_show name="tyrano" wait="false" zindex="10"]
	[chara_show name="yamato"]
	
	#akane
		以上、寸劇でした～。[p]
	;#yamato
	;	それぞれのタグの詳しい使い方は資料集に乗せておくぞ!![p]
	#tyrano:happy
		がお～!!![p]
	
	
	[chara_config time="600" talk_anim="none"]
	
;-----------------------------------------------------------
*End
;-----------------------------------------------------------
	
	; [jump] 目次画面にジャンプします。
	[jump storage="select.ks"]