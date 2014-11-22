#pragma strict

/// Save the initial transform of this object
private var _position:Vector2;

function Start () {
  this._position = new Vector2(
    this.transform.position.x,
    this.transform.position.y
  );
}

function Update () {
  this.transform.position.x = this._position.x;
  this.transform.position.y = this._position.y;
}
