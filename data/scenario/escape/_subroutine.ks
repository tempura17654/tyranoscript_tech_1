
; == subroutine.ks =========================================

; フィックスボタンで飛んでくるサブルーチン群。

; ==========================================================
	
	
	
;-----------------------------------------------------------
*Sub_Empty
	
	[return]
	
	
	
;-----------------------------------------------------------
*Sub_Select
	
	; ※ 注意 ※
	; このラベルに飛んできたときには、
	; フィックスボタンのexpパラメータにもとづいて、
	; 一時変数 tf.top および tf.select に所定の値が入っている。
	
	; 未選択のアイテムをクリックした場合
	[if exp="tf.select != f.select_item"]
		[cursor storage="& 'escape/cursor_' + tf.select + '.png' "]
		[eval exp="f.select_item = tf.select"]
		[anim name=select left=840 top=&tf.top opacity=255 time=0]
	; 現在選択中のアイテムをふたたびクリックした場合
	[else]
		[cursor storage=default]
		[eval exp="f.select_item = 'empty' "]
		[anim name=select opacity=0 time=0]
	[endif]
	
	[return]
	
	
	
;-----------------------------------------------------------
*Sub_Check_Box
	
	[sm2]
		軽い木の箱。[l][er]
		開けられる面はない。[l][er]
	[hm2]
	
	[return]
	
	
	
;-----------------------------------------------------------
*Sub_Check_Bomb
	
	[sm2]
		手榴弾だ。[l][er]
		ピンを抜くだけで爆発させられる。[l][er]
	[hm2]
	
	[return]
	
	
	
;-----------------------------------------------------------
*Sub_Check_Key
	
	[sm2]
		小さな鍵だ。[l][er]
	[hm2]
	
	[return]
	
	
	
;-----------------------------------------------------------
*Sub_Check_LPaper
	
	[sm2]
		「45」と書いてある紙片。[l][er]
		右側に破られた痕がある。[l][er]
	[hm2]
	
	[return]
	
	
	
;-----------------------------------------------------------
*Sub_Check_RPaper
	
	[sm2]
		「27」と書いてある紙片。[l][er]
		左側に破られた痕がある。[l][er]
	[hm2]
	
	[return]