/*******************************
 *  lumi:ext_config.glsl       *
 *******************************/

/*******************************
 *  SYSTEM -DO NOT EDIT-       *
 *******************************/

#include respackopts:config_supplier
#ifndef LUMIEXT_SystemMustEnable

#define LUMIEXT_MaterialCoverage_ApplyAll 0
#define LUMIEXT_MaterialCoverage_NonVanillaFriendly 1

/*******************************
 * vv CONFIGURATIONS START vv  *
 *******************************/

/* Material coverage
 * 0 = apply all materials
 * 1 = don't apply materials that are fine-tuned for vanilla (good for 3rd party resource pack)
 ***********************************************************************************************/
#define LUMIEXT_MaterialCoverage 0

/* Apply bumps to stone, metal and gems 
 * Comment out to disable
 * ("Comment out" means adding double slash at the beginning)
 ***************************************************************/
#define LUMIEXT_ApplyBumpMinerals
// #define LUMIEXT_ApplyBumpMinerals /* this is example of commented out variable. */

/* Apply bumps to every other types of blocks
 ***************************************************************/
#define LUMIEXT_ApplyBumpDefault

/* Apply bumps to tools
 ***************************************************************/
#define LUMIEXT_ApplyToolBump



/*******************************
 * ^^ CONFIGURATIONS END ^^    *
 *******************************/

/* UNUSED VARIABLES (for now) */
// #define LUMIEXT_ApplyArmorBump
// #define LUMIEXT_ApplyEntityBump

/*******************************
 *  SYSTEM -DO NOT EDIT-       *
 *******************************/

#endif
