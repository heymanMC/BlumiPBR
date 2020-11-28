#include lumi:shaders/lib/bump_coarse.glsl
#include frex:shaders/api/fragment.glsl

/******************************************************
  lumi:shaders/material/ice_coarse.frag
******************************************************/

void frx_startFragment(inout frx_FragmentData data) 
{
    float resolution = 64;
    float coarseness = 0.2;
#ifdef LUMI_PBR
    pbr_roughness = 0.1;
#ifdef LUMI_BUMP
    vec2 uvN = floor(frx_var1.zw * resolution)/resolution;
    vec2 uvT = uvN + vec2(0.5/resolution,0);
    vec2 uvB = uvN + vec2(0,0.5/resolution);
    data.vertexNormal = bump_coarse_normal(data.vertexNormal, uvN, uvT, uvB, coarseness);
    // data.spriteColor.rgb *= (data.vertexNormal + 1) * 0.5;
#endif
#endif
}
