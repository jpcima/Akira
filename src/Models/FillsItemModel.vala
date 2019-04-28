/*
* Copyright (c) 2019 Alecaddd (http://alecaddd.com)
*
* This file is part of Akira.
*
* Akira is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.

* Akira is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.

* You should have received a copy of the GNU General Public License
* along with Akira.  If not, see <https://www.gnu.org/licenses/>.
*
* Authored by: Giacomo "giacomoalbe" Alberini <giacomoalbe@gmail.com>
*/

public class Akira.Models.FillsItemModel : GLib.Object {
    public string color {
        owned get {
            debug ("get color %u\n", item.fill_color_rgba);
            string s =
            "rgba(%d,%d,%d,%f)"
            .printf((int)(Math.round(item.fill_color_rgba >> 24 & 0xFF)),
                    (int)(Math.round(item.fill_color_rgba >> 16 & 0xFF)),
                    (int)(Math.round(item.fill_color_rgba >>  8 & 0xFF)),
                                    (item.fill_color_rgba >>  0 & 0xFF) / 255);
            debug ("get int to rgba %s\n", s);
            return s;
        } set {
            debug ("set color: %s\n", value);
            var newRGBA = Gdk.RGBA ();
            newRGBA.parse (value);
            uint rgba = (uint)Math.round(newRGBA.red * 255);
            rgba = (rgba << 8) + (uint)Math.round(newRGBA.green * 255);
            rgba = (rgba << 8) + (uint)Math.round(newRGBA.blue * 255);
            rgba = (rgba << 8) + (uint)Math.round(newRGBA.alpha * 255);
            debug ("set hex2int %u\n", rgba);
            item.fill_color_rgba = rgba;
        }
    }
    public uint opacity { get; set; }
    public new bool visible { get; set; }
    public Akira.Utils.BlendingMode blending_mode { get; set; }
    public Akira.Models.FillsListModel list_model { get; set; }
    public Goo.CanvasItemSimple item { get; construct; }

    public FillsItemModel(Goo.CanvasItemSimple item_simple,
                          int opacity,
                          bool visible,
                          Akira.Utils.BlendingMode blending_mode,
                          Akira.Models.FillsListModel list_model) {
        Object(
            opacity: opacity,
            visible: visible,
            blending_mode: blending_mode,
            list_model: list_model,
            item: item_simple
        );
    }

    public string to_string () {
        var fill_item_repr = "";

        fill_item_repr += "Color: %s\n".printf(color);
        fill_item_repr += "Opacity: %d\n".printf((int) opacity);
        fill_item_repr += "visible: %s\n".printf(visible ? "1" : "0");
        fill_item_repr += "BlendingMode: %s".printf(blending_mode.to_string ());

        return fill_item_repr;
    }
}
