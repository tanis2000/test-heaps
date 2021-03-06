class Main extends hxd.App {
    var g:h2d.Graphics;
    var bmp:h2d.Bitmap;
    var bmp2:h2d.Bitmap;
    var fps:h2d.Text;
    var defaultFont: h2d.Font;

    override function init() {
        trace('Main init');
        g = new h2d.Graphics(s2d);
        
        var tile = h2d.Tile.fromColor(0xFF0000, 100, 100);
        bmp = new h2d.Bitmap(tile, s2d);
        bmp.x = s2d.width * 0.5;
        bmp.y = s2d.height * 0.5;

        var tile2 = h2d.Tile.fromColor(0x00FF00, 100, 100);
        bmp2 = new h2d.Bitmap(tile2, s2d);
        bmp2.x = s2d.width * 0.5 - 150;
        bmp2.y = s2d.height * 0.5;

        defaultFont = hxd.Res.customFont.toFont();
        fps = new h2d.Text(defaultFont, s2d);
        fps.x = 0;
        fps.y = 20;
    }

    override function update(dt:Float) {
        //trace('Main update');
        engine.backgroundColor = 0x404040;
        g.clear();
        
        bmp.rotation += 0.1;
        if (bmp.getBounds().intersects(bmp2.getBounds())) {
            var b = bmp.getBounds();
            g.beginFill(0xFFFFFF, 0.5);
            g.drawRect(b.x, b.y, b.width, b.height);
        }

        fps.text = "" + engine.fps;
    }

    static function main() {
        #if lime
        hxd.Res.initLocal();
        #else
        hxd.Res.initEmbed();
        #end
        trace("pre-instance");
        new Main();
        trace("post-instance");
    }
}
