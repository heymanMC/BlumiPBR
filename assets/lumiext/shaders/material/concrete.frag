#include frex:shaders/api/fragment.glsl
#include lumiext:shaders/internal/frag.glsl

/******************************************************
  lumiext:shaders/material/concrete.frag : based on ice_course.frag
******************************************************/

void frx_startFragment(inout frx_FragmentData data) 
{
  #ifdef LUMI_PBRX
    pbr_roughness = 0.6;
    #ifdef LUMIEXT_ApplyBumpMinerals
      float resRCP = ONE_PIXEL;
      float coarseness = 0.3;
      vec2 uvN = floor(frx_var1.zw / resRCP) * resRCP;
      vec2 uvT = uvN + vec2(0.5 * resRCP, 0.);
      vec2 uvB = uvN + vec2(0., 0.5 * resRCP);
      _applyMicroNormal(data, bump_coarse_normal(data.vertexNormal, uvN, uvT, uvB, l2_tangent, coarseness));
    #endif
  #endif
}
