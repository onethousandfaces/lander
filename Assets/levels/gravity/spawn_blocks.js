#pragma strict

function Start () {
}

function Update () {
  if (Input.GetMouseButtonUp(0)) {
    var camera = Camera.main;
    var value = new Vector3(Input.mousePosition.x,Input.mousePosition.y,-camera.main.transform.position.z);
    var world_pos = camera.ScreenToWorldPoint(value);
    var object = Meta.add_prefab('gravity_block');
    object.transform.position = world_pos;
    meta2d._(object).apply_force(Random.Range(-50000, 50000), Random.Range(-50000, 50000));
  }
}
