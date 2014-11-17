#pragma strict

/** Key to trigger this from */
public var key:KeyCode;

/** Force x */
public var force_x:float;

/** Force y */
public var force_y:float;

/** Parent */
public var parent:GameObject;

/** Busy thrusting */
private var _business:boolean = false;

/** This emitter */
private var _emit:ParticleSystem;

function Start() {
  this._emit = meta._(this).cmp(ParticleSystem) as ParticleSystem;
  this._emit.Stop();
}

function Update () {
  if (Input.GetKeyDown(key)) {
    this._emit.Play();
    this._business = true;
  }
  if (Input.GetKeyUp(key)) {
    this._business = false;
    this._emit.Stop();
  }
  if (this._business) {
    var force = meta2d._(parent).directed_force(this.force_x, this.force_y);
    force = force * Time.deltaTime;
    meta2d._(this).apply_force(force);
  }
}
