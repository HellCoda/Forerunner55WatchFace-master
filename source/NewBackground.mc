import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

module Newbackground {

var _backgroundImage as BitmapResource?;

function setSettings() as Void {
// Charger l'image de fond
_backgroundImage = Application.loadResource(Rez.Drawables.space_id) as BitmapResource;
}

function drawbackground(dc as Dc) as Void {
// Vérifiez que l'image est chargée
if (_backgroundImage != null) {
// Dessiner l'image de fond
dc.drawBitmap(-2, -2, _backgroundImage);
} else {
// Si l'image n'est pas chargée, définir une couleur de fond
dc.setColor(Graphics.COLOR_BLACK, getApp().getProperty("BackgroundColor") as Number);
dc.clear();
}
}
}
