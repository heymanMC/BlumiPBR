#include frex:shaders/api/fragment.glsl
#include frex:shaders/api/world.glsl
#include lumi:shaders/lib/bump.glsl
#include lumi:shaders/lib/apply_bump.glsl

/******************************************************
  lumi:shaders/material/rail.frag
******************************************************/

void frx_startFragment(inout frx_FragmentData data) 
{
#ifdef LUMI_PBR
    vec4 c = data.spriteColor;
    float min_ = min( min(c.r, c.g), c.b );
    float max_ = max( max(c.r, c.g), c.b );
    float s = max_ > 0 ? (max_ - min_) / max_ : 0;
    if (s < 0.2 || (c.g > c.b * 2 && s > 0.6)) {
        data.spriteColor.rgb = min(vec3(1.0), c.rgb * 1.5);
        pbr_metallic = 1.0;
        pbr_roughness = 0.6 - s;
        __applyBump(data);
    }
#endif
}
