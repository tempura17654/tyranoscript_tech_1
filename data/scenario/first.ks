
; == first.ks ==============================================

; ゲームを起動したとき、一番最初に読み込まれるシナリオファイルです。
; このシナリオファイルは、プラグインの読み込みやマクロの定義などの
;《ゲーム全体で必要な初期設定》を行うために使います。
; 初期設定が終わったら、[jump]タグでタイトル画面などに移行しましょう。
; (なお、このシナリオファイルのファイル名を変えてはいけません。)
;
; ==========================================================
	
	
	
	; [title] タイトルバーに表示されるテキストを変更します。
	[title name="ティラノスクリプト｜サンプルテクニック集１"]
	
	; [call]x3 設定用サブルーチンを3つ呼びます。
	[call target="*Sub_Layer"    ]
	[call target="*Sub_Plugin"   ]
	[call target="*Sub_Character"]
	
	;[plugin name="temprider" cache="false"]
	;[jump storage="kaisetsu/12_anim.ks"]
	[jump storage="title.ks"]
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
;　～以下設定用のラベル～
	
	
	
; ----------------------------------------------------------
*Sub_Layer
; ----------------------------------------------------------
	
	; レイヤーの表示非表示などを設定するラベルです。
	; このラベルは、[call]タグによってジャンプしてくるラベル――
	;
	; (このようなラベルをサブルーチンラベルと言います。
	;  また、[call]タグによってサブルーチンラベルにジャンプすることを、
	; 「サブルーチンを呼ぶ」とか「サブルーチンをコールする」とか言います。）
	;
	; ――ですので、終わり際に[return]タグを配置する必要があります。
	; [return] に達した時点で、もとのシナリオの位置に戻ります。
	
	; [layopt] メッセージレイヤーを非表示にします。
	[layopt layer="message" visible="false"]
	
	; [hidemenubutton] メニューボタンを隠します。
	[hidemenubutton]
	
	; [layopt] 通常レイヤー0番･1番･2番を表示してあげます。
	; 初期状態では非表示なので注意。
	[layopt layer="0" visible="true"]
	[layopt layer="1" visible="true"]
	[layopt layer="2" visible="true"]
	
	; [return]
	; [call]タグで呼ばれたところに帰ります。
	[return]
	
	
	
; ----------------------------------------------------------
*Sub_Plugin
; ----------------------------------------------------------
	
	; プラグインの読み込みなどを行うサブルーチンラベルです。
	
	; [call] サブルーチンを呼びます。
	[call storage="macro.ks"]
	
	; [loadcss] cssファイルを読み込みます。独自フォントを使用するためのものです。
	[loadcss file="data/others/font/font.css"]
	[loadcss file="data/others/glink/glink.css"]
	
	; [return] 帰ります。
	[return]
	
	
	
; ----------------------------------------------------------
*Sub_Character
; ----------------------------------------------------------
	
	; キャラクターの定義を行うサブルーチンラベルです。
	
	; [chara_new][chara_face]x4 あかねを定義しています。
	[chara_new  name="akane"  jname="あかね" storage="./chara/akane/normal.png"]
	[chara_face name="akane"   face="angry"  storage="chara/akane/angry.png"   ]
	[chara_face name="akane"   face="doki"   storage="chara/akane/doki.png"    ]
	[chara_face name="akane"   face="happy"  storage="chara/akane/happy.png"   ]
	[chara_face name="akane"   face="sad"    storage="chara/akane/sad.png"     ]
	
	; [chara_new][chara_face]x5 やまとを定義しています。
	[chara_new  name="yamato" jname="やまと" storage="chara/yamato/normal.png" ]
	[chara_face name="yamato"  face="angry"  storage="chara/yamato/angry.png"  ]
	[chara_face name="yamato"  face="happy"  storage="chara/yamato/happy.png"  ]
	[chara_face name="yamato"  face="sad"    storage="chara/yamato/sad.png"    ]
	[chara_face name="yamato"  face="tohoho" storage="chara/yamato/tohoho.png" ]
	
	; [return] 帰ります。
	[return]