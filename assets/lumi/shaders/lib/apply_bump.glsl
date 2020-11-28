// #include lumi:shaders/api/bump.glsl
// #include frex:shaders/api/sampler.glsl
// #include frex:shaders/api/fragment.glsl

#ifdef LUMI_PBR
void __applyBump(inout frx_FragmentData data) 
{
  vec2 uvN = frx_var0.xy;
  vec2 uvT = frx_var0.zw;
  vec2 uvB = frx_var1.xy;
  data.vertexNormal = frx_normalModelMatrix() * bump_normal(frxs_spriteAltas, data.vertexNormal * frx_normalModelMatrix(), uvN, uvT, uvB);
}
#endif
