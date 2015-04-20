// =====================================================================
// LABELS

// General notes:
// - `text-halo-rasterizer: fast;` gives a noticeable performance
//    boost to render times and is recommended for *all* halos.

// ---------------------------------------------------------------------
// Languages

// There are 5 language options in the MapBox Streets vector tiles:
// - Local/default: '[name]'
// - English: '[name_en]'
// - French: '[name_fr]'
// - Spanish: '[name_es]'
// - German: '[name_de]'
@name: '[name_en]';  
@main_label: white;
@halo: fadeout(#000000, 90%);


// ---------------------------------------------------------------------
// Fonts

// All fontsets should have a good fallback that covers as many glyphs
// as possible. 'Arial Unicode MS Regular' and 'Arial Unicode MS Bold' 
//are recommended as final fallbacks if you have them available. 
//They support all the characters used in the MapBox Streets vector tiles.
@fallback: 'Open Sans Regular';
@sans: 'Open Sans Regular', @fallback;
@sans_md: 'Open Sans Semibold', @fallback;
@sans_bd: 'Open Sans Bold', @fallback;
@sans_it: 'Open Sans Italic', @fallback;


// ---------------------------------------------------------------------
// Countries

// The country labels in MapBox Streets vector tiles are placed by hand,
// optimizing the arrangement to fit as many as possible in densely-
// labeled areas.
#country_label[zoom>=3] {
  text-name: @name;
  text-face-name: @sans_bd;
  text-transform: uppercase;
  text-wrap-width: 100;
  text-wrap-before: true;
  text-fill: @main_label;
   text-halo-fill: fadeout(#000000, 90%);
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-line-spacing: -4;
  text-character-spacing: 0.5;
  text-size: 10;
  [zoom>=3][scalerank=1],
  [zoom>=4][scalerank=2],
  [zoom>=5][scalerank=3],
  [zoom>=6][scalerank>3] {
    text-size: 12;
  }
  [zoom>=4][scalerank=1],
  [zoom>=5][scalerank=2],
  [zoom>=6][scalerank=3],
  [zoom>=7][scalerank>3] {
    text-size: 15;
  }
}

#country_label_line {
  // Lines that connect offset labels to small
  // island & coastal countries at small scales.
  line-color: #fff;
  line-dasharray: 3,1;
}

// ---------------------------------------------------------------------
// Marine


// ---------------------------------------------------------------------
// Cities, towns, villages, etc

// City labels with dots for low zoom levels.
// The separate attachment keeps the size of the XML down.


#place_label[zoom>=8][localrank<=3] {
  /*text-name: @name;
  text-face-name: @sans_bd;
  text-wrap-width: 120;
  text-wrap-before: true;
  text-fill: @main_label;
  text-halo-fill: fadeout(#000000, 90%);
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-size: 10;
  
  [type='city'][zoom>=8][zoom<=15] {
  	text-face-name: @sans_md;
    text-size: 16;
    [zoom>=10] { 
      text-size: 18;
      text-wrap-width: 140;
    }
    [zoom>=12] { 
      text-size: 24;
      text-wrap-width: 180;
    }
    // Hide at largest scales:
    [zoom>=16] { text-name: "''"; }
  }
  [type='town'] {
    text-size: 14;
    [zoom>=12] { text-size: 16; }
    [zoom>=14] { text-size: 20; }
    [zoom>=16] { text-size: 24; }
    // Hide at largest scales:
    [zoom>=18] { text-name: "''"; }
  }
  [type='village'] {
    text-size: 12;
    [zoom>=12] { text-size: 14; }
    [zoom>=14] { text-size: 18; }
    [zoom>=16] { text-size: 22; }
  }
  [type='hamlet'],
  [type='suburb'],
  [type='neighbourhood'] {
    text-fill: @main_label;
    text-face-name:	@sans_bd;
    text-transform: uppercase;
    text-character-spacing: 0.5;
    text-halo-fill: fadeout(#000000, 90%);
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
    [zoom>=14] { text-size: 11; }
    [zoom>=15] { text-size: 12; text-character-spacing: 1; }
    [zoom>=16] { text-size: 14; text-character-spacing: 2; }
  }*/
}


// ---------------------------------------------------------------------
// Points of interest

/*#poi_label[zoom=14][scalerank<=1],
#poi_label[zoom=15][scalerank<=2],
#poi_label[zoom=16][scalerank<=3],
#poi_label[zoom=17][scalerank<=4][localrank<=2],
#poi_label[zoom>=18] {
  // Separate icon and label attachments are created to ensure that
  // all icon placement happens first, then labels are placed only
  // if there is still room.
  ::icon[maki!=null] {
    // The [maki] field values match a subset of Maki icon names, so we
    // can use that in our url expression.
    // Not all POIs have a Maki icon assigned, so we limit this section
    // to those that do. See also <https://www.mapbox.com/maki/>
    marker-fill:@main_label;
    marker-file:url('icon/[maki]-12.svg');
  }
  ::label {
    text-name: @name;
    text-face-name: @sans_bd;
    text-size: 18;  
    text-fill: @main_label;
   
   text-halo-fill: fadeout(#000000, 90%);
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
    text-wrap-width: 70;
    text-line-spacing:	-1;
    //text-transform: uppercase;
    //text-character-spacing:	0.25;
    // POI labels with an icon need to be offset:
    [maki!=null] { text-dy: 8; }
  }
}*/


// ---------------------------------------------------------------------
// Roads

#road_label[reflen>=1][reflen<=6]::shield {
  // Motorways with a 'ref' tag that is 1-6 characters long have a
  // [ref] value for shield-style labels.
  // Custom shield png files can be created using make_shields.sh
  // in _src folder
   
  /*shield-name: [ref];
  shield-face-name: @sans_md;
  shield-fill:@main_label;
  shield-min-distance: 60;
  shield-min-padding: 8;  // prevents clipped shields at tile edges
  shield-size: 9;
  shield-file: url('shield/motorway_sm_[reflen].png');
  [zoom>=15] {
    shield-size: 11;
    shield-file: url('shield/motorway_lg_[reflen].png');
  }
 */
}

#road_label [class='main'][zoom>=14] {
  text-name: @name;
  text-placement: line;  // text follows line path
  text-face-name: @sans_md; 
  text-fill: @main_label;
  text-halo-fill: fadeout(#000000, 50%);
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-size: 12;
  text-avoid-edges: true;  // prevents clipped labels at tile edges
  [zoom>=15] { text-size: 13; }
}


// ---------------------  ------------------------------------------------
// Water




// ---------------------------------------------------------------------
// House numbers

#housenum_label[zoom>=18] {
  text-name: [house_num];
  text-face-name: @sans_it;
  text-fill: #cba;
  text-size: 8;
  [zoom=19] { text-size: 10; }
  [zoom>=20] { text-size: 12; }
}