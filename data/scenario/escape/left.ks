
; == left.ks ===============================================

; 部屋左手。

; ==========================================================

[eval exp="f.current_scenario = TYRANO.kag.stat.current_scenario"]
[sb]
[scm]
[s]

;-------------------------------------------------------
*Sub_Set_Background

[cm]
[freeimage layer=0 page=back]
[image layer=0 page=back x=0 y=0 storage=escape/left.png]
[image layer=0 page=back x=0 y=0 storage=escape/left_box.png name=layerbox cond="f.develops[f.current_scenario] == 0"]
[trans layer=0 time=400 method=fadeInLeft]
[wt]
[return]

;-------------------------------------------------------
*Sub_Set_Clickable_Map

[mc 1 ゴミ箱 x=222 y=495 width=75  height=87  target=*Pos_1]
[mc 2 木の箱 x=467 y=466 width=126 height=136 target=*Pos_2 cond="f.develops[f.current_scenario] == 0"]
[mc 3 壁     x=364 y=345 width=53  height=32  target=*Pos_3]
[mc 4 ドア   x=55  y=255 width=114 height=381 target=*Pos_4]
[button storage=escape/right.ks graphic=escape/button_right.png x=700  y=300]
[return]

;-------------------------------------------------------
*Pos_1
[sm]
ゴミ箱がある。[l][er]
中には何も入っていない。[l][er]
[hm]
[scm][s]

;-------------------------------------------------------
*Pos_2
; 発展度０
[if exp="f.develops[f.current_scenario] == 0"]
[sm]
木の箱がある。[l][er]
ふたになっている面はない。[l][er]
軽くて持ち運びは楽そうだ。[l][er]
[hm]
[get item=box]
[eval exp="f.develops[f.current_scenario] = 1"]
; 発展度１～
[elsif exp="f.develops[f.current_scenario] >= 1"]
[ERROR!!]
[endif]
[scm][s]

;-------------------------------------------------------
*Pos_3
[jump storage=escape/wall.ks]

;-------------------------------------------------------
*Pos_4
[jump storage=escape/room.ks]