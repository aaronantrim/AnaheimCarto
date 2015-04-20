
Map {
  background-color: rgba(255,255,255,0);
  }
@mappurple: rgb(163, 96, 226);

 #jan9_anaheim_routes_featureCollection {
  line-width:4;
  opacity: 1;
  line-color: @mappurple;

  
} 


 #jan9_anaheim_routes_featureCollection::shadowz {
   line-color: darken(@mappurple, 35);
   line-opacity: 1;
   line-width: 8;
}


 #jan9_anaheim_routes_featureCollection::whiteoutline {
   line-color: lighten(@mappurple, 15);
   line-opacity: 1;
   line-width: 5;
}

 #jan9_anaheim_routes_featureCollection::glow {
   line-color: @mappurple;
   line-width: 3;

}

