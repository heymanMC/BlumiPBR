#include frex:shaders/api/fragment.glsl
#include frex:shaders/api/context.glsl
#include frex:shaders/api/world.glsl
#include lumi:shaders/lib/bump.glsl
#include lumi:shaders/internal/ext_frag.glsl

/******************************************************
  lumi:shaders/material/tool_gem.frag
******************************************************/

void frx_startFragment(inout frx_FragmentData data) 
{
#if LUMIEXT_MaterialCoverage == LUMIEXT_MaterialCoverage_ApplyAll
#ifdef LUMI_PBRX
  if (data.spriteColor.b > data.spriteColor.r) {
  #if LUMI_PBR_API >= 1
    pbr_f0 = vec3(0.17);
  #endif
    pbr_roughness = 0.05;
#ifdef LUMI_BUMP
#ifdef LUMIEXT_ApplyBumpDefault
#ifdef LUMIEXT_ApplyToolBump
    _applyBump_step(data, 0.25, 0.8);
#endif
#endif
#endif
  }
#endif
#endif
}
