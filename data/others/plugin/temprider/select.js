// 厳格モードで実行
'use strict';

// 無名関数を即実行
(function( global ) {

	// 変数を宣言
	var clipboard, tag_base, is_down, getPos, orgPos, posStart, posEnd, j_div, onRectSelect, offRectSelect;

	// ドラッグを有効に
	$('.tyrano_base').attr('ondragstart','');

	// クリップボードを取得
	clipboard = require('nw.gui').Clipboard.get();

	// いまマウスのボタンは押下されているか？
	is_down = false;

	// マウス位置を取得する関数を定義 (get position)
	// ゲーム画面の余白および拡大縮小を考慮しない
	getPos = function (e) {
		myTyrano.convertPageXY(e);
	    return gridPos(e.tyranoX, e.tyranoY, 40, 40)
	    return {
	        x: e.tyranoX,
	        y: e.tyranoY
	    };
	}
	
	var gridPosOne, gridPos;
	
	gridPosOne = function (x, gx) {
		return Math.round(x / gx) * gx;
	}
	
	gridPos = function (x, y, gx, gy) {
		return {
			x: gridPosOne(x, gx),
			y: gridPosOne(y, gy)
		};
	}

	// 2点のマウス位置を整理する関数を定義 (organize positions)
	// 2点の座標 pos1, pos2 によって決定される矩形の
	// 左上の座標 x, y および幅と高さ w, h をプロパティに持つような
	// オブジェクトを返す
	orgPos = function (pos1, pos2) {
	    var ret = {};
	    if (pos1.x > pos2.x) {
	        ret.x = pos2.x
	        ret.w = pos1.x - pos2.x;
	    } else {
	        ret.x = pos1.x
	        ret.w = pos2.x - pos1.x;
	    };
	    if (pos1.y > pos2.y) {
	        ret.y = pos2.y
	        ret.h = pos1.y - pos2.y;
	    } else {
	        ret.y = pos1.y
	        ret.h = pos2.y - pos1.y;
	    };
	    return ret;
	}
	
	// マウスダウン時のマウス位置
	posStart = {
	    x: 0,
	    y: 0
	};
	
	// マウスアップ時のマウス位置
	posEnd = {
	    x: 0,
	    y: 0
	}
	
	offRectSelect = function (name) {
		
		var eventName;
		eventName = '.rect-select-' + name;
		
		$('.tyrano_base').off('mousedown' + eventName);
		$('.tyrano_base').off('mousemove' + eventName);
		$('.tyrano_base').off('mouseup' + eventName);
	}
	
	onRectSelect = function (name, callback) {
		
		var eventName;
		eventName = '.rect-select-' + name;
		
		// mousedown イベントハンドラに関数を渡す
		$('.tyrano_base').on('mousedown' + eventName, function(e) {
		    // フラグを立てて
		    is_down = true;
		    // マウス位置を取得
		    var pos = getPos(e);
		    posStart = pos;
		    // div 要素を作って挿入する
		    j_div = $('<div>');
		    j_div.css({
		    	'z-index': '100000002',
		        'position': 'absolute',
		        'left': pos.x + 'px',
		        'top': pos.y + 'px',
		        'width': '1px',
		        'height': '1px',
		        'background': 'white',
		        'opacity': '0.4'
		    });
		    j_div.appendTo('.tyrano_base');
		});
		
		// mousemove イベントハンドラに関数を渡す
		$('.tyrano_base').on('mousemove' + eventName, function(e) {
		    // マウス押下中でなければ無視
		    if (! is_down) return false;
		    // マウス位置を取得
		    var pos = getPos(e);
		    posEnd = pos;
		    // マウス位置の整理
		    var ret = orgPos(posStart, posEnd);
		    // div 要素のスタイルの更新
		    j_div.css({
		        'top': ret.y + 'px',
		        'left': ret.x + 'px',
		        'width': ret.w + 'px',
		        'height': ret.h + 'px'
		    });
		});
		
		// mouseup イベントハンドラに関数を渡す
		$('.tyrano_base').on('mouseup' + eventName, function(e) {
		    // フラグを折る
		    is_down = false;
		    // マウス位置の取得
		    var pos = getPos(e);
		    posEnd = pos;
		    // マウス位置の整理
		    var ret = orgPos(posStart, posEnd);
		    // div 要素はフェードアウト後削除
		    j_div.fadeOut(1000, function() {
		        $(this).remove();
		    });
		    // コールバックを呼ぶ
		    callback(ret);
		});
	}
	myTyrano.copy = function (text) {
		clipboard.set(text, 'text');
	}
	
	myTyrano.onRectSelect = onRectSelect;
	myTyrano.offRectSelect = offRectSelect;
    
}( window )); // グローバル領域にmyDisplayを定義した！


var isVisibleGrid = false;
$(window).on('keydown', function (e) {
	switch (e.keyCode) {
	case 71:
		if (isVisibleGrid) {
			isVisibleGrid = false;
			$('.temprider-grid').remove();
		} else {
			isVisibleGrid = true;
			var gw = 40;
			var gh = 40;
			var w  = 960;
			var h  = 640;
			var xn = Math.floor(w / gw);
			var yn = Math.floor(h / gh);
			for (var x, i = 0; i < xn; i++) {
				x = i * gw;
				var $div = $('<div />');
				$div.addClass('temprider-grid');
				$div.css({
			    	'z-index': '100000002',
			        'position': 'absolute',
			        'left': x + 'px',
			        'top': 0 + 'px',
			        'width': '1px',
			        'height': h + 'px',
			        'background': 'white',
			        'opacity': '0.4'
				});
				$('.tyrano_base').append($div);
			}
			for (var y, i = 0; i < yn; i++) {
				y = i * gh;
				var $div = $('<div />');
				$div.addClass('temprider-grid');
				$div.css({
			    	'z-index': '100000002',
			        'position': 'absolute',
			        'left': 0 + 'px',
			        'top': y + 'px',
			        'width': w + 'px',
			        'height': '1px',
			        'background': 'white',
			        'opacity': '0.4'
				});
				$('.tyrano_base').append($div);
			}
		}
		break;
	}
});





