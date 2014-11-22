Shader "Custom/dynamic_shades" {
  Properties {
    _Vector1 ("Direction", Vector) = (0, 0, 0, 0)
    _Color1 ("Start Color", Color) = (1, 0, 1, 1)
    _Color2 ("End Color", Color) = (0, 0, 1, 1)
    _Size ("Size", Float) = 1.0
    _Base ("Base Opacity", Float) = 0.2
  }
  SubShader {
    Blend SrcAlpha OneMinusSrcAlpha
    Pass {
      CGPROGRAM

      #pragma vertex vert
      #pragma fragment frag
      #pragma target 3.0

      #include "UnityCG.cginc"

      #define PI 3.141516

      uniform float4 _Vector1;
      uniform float4 _Color1;
      uniform float4 _Color2;
      uniform float _Size;
      uniform float _Base;

      struct vertexInput {
        float4 vertex : POSITION;
        float4 texcoord0 : TEXCOORD0;
      };

      struct fragmentInput{
        float4 position : SV_POSITION;
        float4 texcoord0 : TEXCOORD0;
      };

      fragmentInput vert(vertexInput i){
        fragmentInput o;
        o.position = mul (UNITY_MATRIX_MVP, i.vertex);
        o.texcoord0 = i.texcoord0;
        return o;
      }

      float delta(float2 p1, float2 p2) {
        return sqrt((p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y));
      }

      float projected(float2 p) {
        float m = (_Vector1.w - _Vector1.y) / (_Vector1.z - _Vector1.x);
        float b = _Vector1.y - (m * _Vector1.x);
        float x = (m * p.y + p.x - m * b) / (m * m + 1);
        float y = (m * m * p.y + m * p.x + b) / (m * m + 1);
        return float2(x, y);
      }

      float magn(float2 p) {
        float max = delta(_Vector1.xy, _Vector1.zw);
        float value = delta(_Vector1.xy, p) - delta(_Vector1.zw, p);
        float factor = 1.0 - value / max;
        return factor * (
          factor * sin(p.x * PI * _Size + _Time[1]) * sin(p.y * PI * _Size + _Time[1]) +
          cos((1.0 - p.x) * PI * _Size + _Time[1]) * cos((1.0 - p.y) * PI * _Size + _Time[1]) +
          (1.0 - _Base) * factor * sin(p.x * PI * _Size - _Time[1]) * cos(p.y * PI * _Size + _Time[1])
        );
      }

      float map(float c1, float c2, float factor) {
        return c1 + factor * (c2 - c1);
      }

      float4 frag(fragmentInput i) : COLOR {
        float2 p = projected(i.texcoord0.xy);
        float n = magn(p);
        return float4(
          map(_Color1.r, _Color2.r, n * sin(i.texcoord0.x * PI * _Size + _Time[1]) * sin(i.texcoord0.y * PI * _Size + _Time[1])),
          map(_Color1.g, _Color2.g, n * cos((1.0 - i.texcoord0.x) * PI * _Size + _Time[1]) * cos((1.0 - i.texcoord0.y) * PI * _Size + _Time[1])),
          map(_Color1.b, _Color2.b, n * sin(i.texcoord0.x * PI * _Size - _Time[1]) * cos(i.texcoord0.y * PI * _Size + _Time[1])),
          2 * magn(i.texcoord0.xy)
        );
      }
      ENDCG
    }
  }
}
