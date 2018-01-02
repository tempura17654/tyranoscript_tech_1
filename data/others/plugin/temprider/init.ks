[loadjs storage="plugin/temprider/display.js" cond="TYRANO.kag.is_rider"]
[loadjs storage="plugin/temprider/select.js" cond="TYRANO.kag.is_rider"]
[loadjs storage="plugin/temprider/main.js" cond="TYRANO.kag.is_rider"]
[iscript]
	// タグの基礎データを定義
	var tag_base = '[image layer=0 storage=color/white.png x={x} y={y} width={w} height={h}]';
	/*
	myTyrano.onRectSelect('aaa', function (rect) {
	    // タグの基礎データをコピー
	    var tag = tag_base;
	    // 置換していく
	    tag = tag
	    .replace('{x}', rect.x)
	    .replace('{y}', rect.y)
	    .replace('{w}', rect.w)
	    .replace('{h}', rect.h);
	    // クリップボードにコピー
	    myTyrano.copy(tag);
	});
	*/
[endscript]
[return]