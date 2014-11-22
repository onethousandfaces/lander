#pragma strict

private var _touched:float = 0f;
public var _touching:int = 0;

function Start () {
}

function Update () {
  if (this._touched > 2) {
    meta._(this).destroy();
  }
  if (this._touching > 0) {
    this._touched += Time.deltaTime;
  }
}

function OnCollisionExit2D(theCollision : Collision2D) {
  this._touching -= 1;
  if (this._touching == 0) {
    this._touched = 0f;
  }
}

function OnCollisionEnter2D(theCollision : Collision2D) {
  this._touching += 1;
}
