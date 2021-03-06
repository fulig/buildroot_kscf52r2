/***************************************************************************/

/*
 *  linux/arch/m68knommu/platform/520x/config.c
 *
 *  Copyright (C) 2005,      Freescale (www.freescale.com)
 *  Copyright (C) 2005,      Intec Automation (mike@steroidmicros.com)
 *  Copyright (C) 1999-2007, Greg Ungerer (gerg@snapgear.com)
 *  Copyright (C) 2001-2003, SnapGear Inc. (www.snapgear.com)
 */

/***************************************************************************/

#include <linux/kernel.h>
#include <linux/param.h>
#include <linux/init.h>
#include <linux/io.h>
#include <asm/machdep.h>
#include <asm/coldfire.h>
#include <asm/mcfsim.h>
#include <asm/mcfuart.h>
#include <asm/mcfclk.h>

/***************************************************************************/

DEFINE_CLK(0, "flexbus", 2, MCF_CLK);
DEFINE_CLK(0, "fec.0", 12, MCF_CLK);
DEFINE_CLK(0, "edma", 17, MCF_CLK);
DEFINE_CLK(0, "intc.0", 18, MCF_CLK);
DEFINE_CLK(0, "iack.0", 21, MCF_CLK);
DEFINE_CLK(0, "mcfi2c.0", 22, MCF_CLK);
DEFINE_CLK(0, "mcfqspi.0", 23, MCF_CLK);
DEFINE_CLK(0, "mcfuart.0", 24, MCF_BUSCLK);
DEFINE_CLK(0, "mcfuart.1", 25, MCF_BUSCLK);
DEFINE_CLK(0, "mcfuart.2", 26, MCF_BUSCLK);
DEFINE_CLK(0, "mcftmr.0", 28, MCF_CLK);
DEFINE_CLK(0, "mcftmr.1", 29, MCF_CLK);
DEFINE_CLK(0, "mcftmr.2", 30, MCF_CLK);
DEFINE_CLK(0, "mcftmr.3", 31, MCF_CLK);

DEFINE_CLK(0, "mcfpit.0", 32, MCF_CLK);
DEFINE_CLK(0, "mcfpit.1", 33, MCF_CLK);
DEFINE_CLK(0, "mcfeport.0", 34, MCF_CLK);
DEFINE_CLK(0, "mcfwdt.0", 35, MCF_CLK);
DEFINE_CLK(0, "pll.0", 36, MCF_CLK);
DEFINE_CLK(0, "sys.0", 40, MCF_BUSCLK);
DEFINE_CLK(0, "gpio.0", 41, MCF_BUSCLK);
DEFINE_CLK(0, "sdram.0", 42, MCF_CLK);

struct clk *mcf_clks[] = {
  &__clk_0_2, /* flexbus */
  &__clk_0_12, /* fec.0 */
  &__clk_0_17, /* edma */
  &__clk_0_18, /* intc.0 */
  &__clk_0_21, /* iack.0 */
  &__clk_0_22, /* mcfi2c.0 */
  &__clk_0_23, /* mcfqspi.0 */
  &__clk_0_24, /* mcfuart.0 */
  &__clk_0_25, /* mcfuart.1 */
  &__clk_0_26, /* mcfuart.2 */
  &__clk_0_28, /* mcftmr.0 */
  &__clk_0_29, /* mcftmr.1 */
  &__clk_0_30, /* mcftmr.2 */
  &__clk_0_31, /* mcftmr.3 */

  &__clk_0_32, /* mcfpit.0 */
  &__clk_0_33, /* mcfpit.1 */
  &__clk_0_34, /* mcfeport.0 */
  &__clk_0_35, /* mcfwdt.0 */
  &__clk_0_36, /* pll.0 */
  &__clk_0_40, /* sys.0 */
  &__clk_0_41, /* gpio.0 */
  &__clk_0_42, /* sdram.0 */
NULL,
};

static struct clk * const enable_clks[] __initconst = {
  &__clk_0_2, /* flexbus */
  &__clk_0_18, /* intc.0 */
  &__clk_0_21, /* iack.0 */
  &__clk_0_24, /* mcfuart.0 */
  &__clk_0_25, /* mcfuart.1 */
  &__clk_0_26, /* mcfuart.2 */

  &__clk_0_32, /* mcfpit.0 */
  &__clk_0_33, /* mcfpit.1 */
  &__clk_0_34, /* mcfeport.0 */
  &__clk_0_36, /* pll.0 */
  &__clk_0_40, /* sys.0 */
  &__clk_0_41, /* gpio.0 */
  &__clk_0_42, /* sdram.0 */
};

static struct clk * const disable_clks[] __initconst = {
  &__clk_0_12, /* fec.0 */
  &__clk_0_17, /* edma */
  &__clk_0_22, /* mcfi2c.0 */
  &__clk_0_23, /* mcfqspi.0 */
  &__clk_0_28, /* mcftmr.0 */
  &__clk_0_29, /* mcftmr.1 */
  &__clk_0_30, /* mcftmr.2 */
  &__clk_0_31, /* mcftmr.3 */
  &__clk_0_35, /* mcfwdt.0 */
};


static void __init m520x_clk_init(void)
{
  unsigned i;

  /* make sure these clocks are enabled */
  for (i = 0; i < ARRAY_SIZE(enable_clks); ++i)
    __clk_init_enabled(enable_clks[i]);
  /* make sure these clocks are disabled */
  for (i = 0; i < ARRAY_SIZE(disable_clks); ++i)
    __clk_init_disabled(disable_clks[i]);
}

/***************************************************************************/

void __init config_BSP(char *commandp, int size)
{
  mach_sched_init = hw_timer_init;
}

/***************************************************************************/
