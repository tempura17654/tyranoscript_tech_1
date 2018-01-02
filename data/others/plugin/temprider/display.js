// 厳格モードで実行
'use strict';

// 無名関数を即実行
(function( global ) {
    
    // TyranoDisplayオブジェクトのコンストラクタ定義
    var TyranoDisplay = function () {
        
        // thisの保存
        var that = this;
        
        // プロパティの初期化
        this.timer          = NaN;
        this.windowWidth    = parseInt( tyrano.plugin.kag.config.scWidth );
        this.windowHeight   = parseInt( tyrano.plugin.kag.config.scHeight );
        this.currentScale   = 1;
        this.currentWidth   = this.windowWidth;
        this.currentHeight  = this.windowHeight;
        this.currentTop     = 0;
        this.currentLeft    = 0;
        this.originalWidth  = this.windowWidth;
        this.originalHeight = this.windowHeight;
        this.resizeHandlers = {}
        
        // ウィンドウリサイズハンドラの追加メソッド
        this.onResize = function ( name, fn ) {
            var handlers = that.resizeHandlers;
            if (! fn ) {
                fn = name;
                name = '' + Object.keys( handlers ).length;
            }
            if ( typeof fn === 'function' && typeof name === 'string' ) {
                handlers[ name ] = fn;
            }
        }
        
        // ウィンドウリサイズハンドラの削除メソッド
        this.offResize = function ( name ) {
            var handlers = that.resizeHandlers;
            
            // name が未定義なら全削除
            if (! name ) {
                var key;
                for ( key in handlers ) {
                    delete handlers[ key ];
                }
            }
            
            // name に文字列が入っていればそれをキーにして削除
            else if ( typeof name === 'string' ) {
                delete handlers[ name ];
            }
        }
        
        // マウスイベントで得られる pageX, pageY の値に対して
        // ゲーム画面の位置/拡縮の補正をおこなったプロパティを作るメソッド
        this.convertPageXY = function ( e ) {
            var x = e.pageX - this.currentLeft;
            var y = e.pageY - this.currentTop;
            x = (x / this.currentScale)|0;
            y = (y / this.currentScale)|0;
            e.tyranoX = x;
            e.tyranoY = y;
        }
        
        // データ更新関数
        var updateSelf = function () {
            var view   = $.getViewPort();
            var scale  = Math.round( TYRANO.base.tyrano.kag.tmp.base_scale * 100 ) / 100;
            var base   = $('.tyrano_base').offset();
            that.windowWidth   = view.width;
            that.windowHeight  = view.height;
            that.currentScale  = scale;
            that.currentWidth  = Math.round( scale * that.originalWidth );
            that.currentHeight = Math.round( scale * that.originalHeight );
            that.currentTop    = base.top;
            that.currentLeft   = base.left;
        }
        
        // とりあえず1秒後にデータ更新関数を1回実行
        setTimeout( updateSelf, 1000 );
        
        // リサイズイベント
        var eventType = 'orientationchange resize';
        
        // window のリサイズイベントにハンドラを追加
        $( window ).bind( eventType, function () {
            
            // リサイズしてから100ﾐﾘ秒後に1度だけ実行する
            clearTimeout( that.timer );
            that.timer = setTimeout( function () {
                
                // データ更新関数
                updateSelf();
                
                // 追加されたハンドラをすべて実行
                var key, handlers = that.resizeHandlers;
                for ( key in handlers ) {
                    handlers[ key ]();
                }
            }, 100 );
        });
    } // コンストラクタ定義おわり
    
    // コンストラクタを用いてTyranoDisplayオブジェクトを生成
    if ( typeof global.myTyrano === 'undefined' ) {
        global.myTyrano = new TyranoDisplay();
    }
    
}( window )); // グローバル領域にmyDisplayを定義した！


/*
// ウィンドウリサイズ時に呼ばれる関数を【追加】。その識別子は'A'
myDisplay.onResize( 'A', function () {
    console.log( 'resized.' );
});

// ウィンドウリサイズ時に呼ばれる関数を【追加】。その識別子は'B'
myDisplay.onResize( 'B', function () {
    console.log( myDisplay );
});

// ウィンドウリサイズ時に呼ばれる関数を【削除】。その識別子は'A'
// myDisplay.offResize( 'A' );

// .tyrano_base 上でマウスが動いたら
$( '.tyrano_base' ).on( 'mousemove', function ( e ) {
    
    // いかなる拡縮・センタリング状況であろうと
    //「０～コンフィグで設定した画面サイズ」に補正した値を得る
    myDisplay.convertPageXY( e );
    
    // 表示してみる
    console.log( e.tyranoX + ', ' + e.tyranoY );
});
*/