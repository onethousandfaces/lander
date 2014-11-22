#pragma strict

import System.Collections.Generic;
import System.Reflection;

/// Starting vector
public var init:Vector2 = new Vector2(0, 0);

/// Set of massive body elements we've found
private var _sources:Meta2d[];
private var _self:Meta2d;

function Start () {
  this._sources = meta2d._(massive_body);
  this._self = meta2d._(this);
  this._self.apply_force(this.init);
}

function Update () {
  var r = this._self.cmp(Rigidbody2D) as Rigidbody2D;
  if (r != null) {
    var g = r.gravityScale;
    for (var source in this._sources) {
      var r2 = source.cmp(Rigidbody2D) as Rigidbody2D;
      var g2 = r2.gravityScale * g;
      var magn = this._self.gravity(source, g2) * Time.deltaTime;
      this._self.move_towards(source, magn);
    }
  }
}
