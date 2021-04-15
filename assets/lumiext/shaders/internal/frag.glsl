#include frex:shaders/lib/math.glsl
#include frex:shaders/api/sampler.glsl
#include frex:shaders/api/fragment.glsl
#include frex:shaders/api/material.glsl
#include lumiext:config.glsl
#include lumi:shaders/api/pbr_ext.glsl

// Fallback
#if !defined(LUMI_PBR_API) || LUMI_PBR_API < 2
  in vec3 l2_tangent;
#endif

/* legacy bump height */
#define _bump_height(raw) frx_smootherstep(0, 1, pow(raw, 1 + raw * raw))

#define _bump_height2(x) sqrt((x.r + x.g + x.b) * 0.33333 * 2.0)

#include lumiext:shaders/lib/bump2.glsl
#include lumiext:shaders/lib/bump_alpha.glsl
#include lumiext:shaders/lib/bump_step.glsl
#include lumiext:shaders/lib/bump_step_s.glsl
#include lumiext:shaders/lib/bump_coarse.glsl

/******************************************************
  lumiext:shaders/internal/frag.glsl
******************************************************/

void _applyBump(inout frx_FragmentData data) 
{
  vec2 topRight = frx_var3.xy;
  vec2 uvN = frx_var0.xy;
  vec2 uvT = frx_var0.zw;
  vec2 uvB = frx_var1.xy;
  data.vertexNormal =  bump_normal2(
    frxs_baseColor, data.vertexNormal ,
    uvN, uvT, uvB, topRight, l2_tangent, false);
}

void _applyBump(inout frx_FragmentData data, bool reverse) 
{
  vec2 topRight = frx_var3.xy;
  vec2 uvN = frx_var0.xy;
  vec2 uvT = frx_var0.zw;
  vec2 uvB = frx_var1.xy;
  data.vertexNormal =  bump_normal2(
    frxs_baseColor, data.vertexNormal ,
    uvN, uvT, uvB, topRight, l2_tangent, reverse);
}

void _applyBump_alpha(inout frx_FragmentData data, bool reverse) 
{
  vec2 topRight = frx_var3.xy;
  vec2 uvN = frx_var0.xy;
  vec2 uvT = frx_var0.zw;
  vec2 uvB = frx_var1.xy;
  data.vertexNormal =  bump_alpha_normal(
    frxs_baseColor, data.vertexNormal ,
    uvN, uvT, uvB, topRight, l2_tangent, reverse);
}

void _applyBump_step(inout frx_FragmentData data, float step_, float strength, bool reverse) 
{
  vec2 topRight = frx_var3.xy;
  vec2 uvN = frx_var0.xy;
  vec2 uvT = frx_var0.zw;
  vec2 uvB = frx_var1.xy;
  data.vertexNormal =  bump_step_normal(
    frxs_baseColor, data.vertexNormal ,
    uvN, uvT, uvB, topRight, l2_tangent,
    step_, strength, reverse);
}

void _applyBump_step_s(inout frx_FragmentData data, float step_, float strength, bool reverse) 
{
  vec2 topRight = frx_var3.xy;
  vec2 uvN = frx_var0.xy;
  vec2 uvT = frx_var0.zw;
  vec2 uvB = frx_var1.xy;
  data.vertexNormal = bump_step_s_normal(
    frxs_baseColor, data.vertexNormal,
    uvN, uvT, uvB, topRight, l2_tangent,
    step_, strength, reverse);
}
