/*
 * LPC32xxGPIO driver
 *
 * (C) Copyright 2014  DENX Software Engineering GmbH
 * Written-by: Albert ARIBAUD <albert.aribaud@3adev.fr>
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

#include <asm/io.h>
#include <asm/arch-lpc32xx/cpu.h>
#include <asm/arch-lpc32xx/gpio.h>
#include <asm-generic/gpio.h>
#include <dm.h>

/**
 * LPC32xx GPIOs work in banks but are non-homogeneous:
 * - each bank holds a different number of GPIOs
 * - some GPIOs are input/ouput, some input only, some output only;
 * - some GPIOs have different meanings as an input and as an output;
 * - some GPIOs are controlled on a given port and bit index, but
 *   read on another one.
*
 * In order to keep this code simple, GPIOS are considered here as
 * homogeneous and linear, from 0 to 127.
 *
 *	** WARNING #1 **
 *
 * Client code is responsible for properly using valid GPIO numbers,
 * including cases where a single physical GPIO has differing numbers
 * for setting its direction, reading it and/or writing to it.
 *
 *	** WARNING #2 **
 *
 * Please read NOTE in description of lpc32xx_gpio_get_function().
 */

#define LPC32XX_GPIOS 128

struct lpc32xx_gpio_platdata {
	struct gpio_regs *regs;
	/* GPIO FUNCTION: SEE WARNING #2 */
	signed char function[LPC32XX_GPIOS];
};

/**
 * We have 4 GPIO ports of 32 bits each
 */

#define MAX_GPIO 128

#define GPIO_TO_PORT(gpio) ((gpio / 32) & 3)
#define GPIO_TO_RANK(gpio) (gpio % 32)
#define GPIO_TO_MASK(gpio) (1 << (gpio % 32))

/**
 * Configure a GPIO number 'offset' as input
 */

static int lpc32xx_gpio_direction_input(struct udevice *dev, unsigned offset)
{
	int port, mask;
	struct lpc32xx_gpio_platdata *gpio_platdata = dev_get_platdata(dev);
	struct gpio_regs *regs = gpio_platdata->regs;

	port = GPIO_TO_PORT(offset);
	mask = GPIO_TO_MASK(offset);

	switch (port) {
	case 0:
		writel(mask, &regs->p0_dir_clr);
		break;
	case 1:
		writel(mask, &regs->p1_dir_clr);
		break;
	case 2:
		/* ports 2 and 3 share a common direction */
	case 3:
		writel(mask, &regs->p2_p3_dir_clr);
		break;
	default:
		return -1;
	}

	/* GPIO FUNCTION: SEE WARNING #2 */
	gpio_platdata->function[offset] = GPIOF_INPUT;

	return 0;
}

/**
 * Get the value of a GPIO
 */

static int lpc32xx_gpio_get_value(struct udevice *dev, unsigned offset)
{
	int port, rank, mask, value;
	struct lpc32xx_gpio_platdata *gpio_platdata = dev_get_platdata(dev);
	struct gpio_regs *regs = gpio_platdata->regs;

	port = GPIO_TO_PORT(offset);

	switch (port) {
	case 0:
		value = readl(&regs->p0_inp_state);
		break;
	case 1:
		value = readl(&regs->p1_inp_state);
		break;
	case 2:
		value = readl(&regs->p2_inp_state);
		break;
	case 3:
		value = readl(&regs->p3_inp_state);
		break;
	default:
		return -1;
	}

	rank = GPIO_TO_RANK(offset);
	mask = GPIO_TO_MASK(offset);

	return (value & mask) >> rank;
}

/**
 * Set a GPIO
 */

static int gpio_set(struct udevice *dev, unsigned gpio)
{
	int port, mask;
	struct lpc32xx_gpio_platdata *gpio_platdata = dev_get_platdata(dev);
	struct gpio_regs *regs = gpio_platdata->regs;

	port = GPIO_TO_PORT(gpio);
	mask = GPIO_TO_MASK(gpio);

	switch (port) {
	case 0:
		writel(mask, &regs->p0_outp_set);
		break;
	case 1:
		writel(mask, &regs->p1_outp_set);
		break;
	case 2:
		writel(mask, &regs->p2_outp_set);
		break;
	case 3:
		writel(mask, &regs->p3_outp_set);
		break;
	default:
		return -1;
	}
	return 0;
}

/**
 * Clear a GPIO
 */

static int gpio_clr(struct udevice *dev, unsigned gpio)
{
	int port, mask;
	struct lpc32xx_gpio_platdata *gpio_platdata = dev_get_platdata(dev);
	struct gpio_regs *regs = gpio_platdata->regs;

	port = GPIO_TO_PORT(gpio);
	mask = GPIO_TO_MASK(gpio);

	switch (port) {
	case 0:
		writel(mask, &regs->p0_outp_clr);
		break;
	case 1:
		writel(mask, &regs->p1_outp_clr);
		break;
	case 2:
		writel(mask, &regs->p2_outp_clr);
		break;
	case 3:
		writel(mask, &regs->p3_outp_clr);
		break;
	default:
		return -1;
	}
	return 0;
}

/**
 * Set the value of a GPIO
 */

static int lpc32xx_gpio_set_value(struct udevice *dev, unsigned offset,
				 int value)
{
	if (value)
		return gpio_set(dev, offset);
	else
		return gpio_clr(dev, offset);
}

/**
 * Configure a GPIO number 'offset' as output with given initial value.
 */

static int lpc32xx_gpio_direction_output(struct udevice *dev, unsigned offset,
				       int value)
{
	int port, mask;
	struct lpc32xx_gpio_platdata *gpio_platdata = dev_get_platdata(dev);
	struct gpio_regs *regs = gpio_platdata->regs;

	port = GPIO_TO_PORT(offset);
	mask = GPIO_TO_MASK(offset);

	switch (port) {
	case 0:
		writel(mask, &regs->p0_dir_set);
		break;
	case 1:
		writel(mask, &regs->p1_dir_set);
		break;
	case 2:
		/* ports 2 and 3 share a common direction */
	case 3:
		writel(mask, &regs->p2_p3_dir_set);
		break;
	default:
		return -1;
	}

	/* GPIO FUNCTION: SEE WARNING #2 */
	gpio_platdata->function[offset] = GPIOF_OUTPUT;

	return lpc32xx_gpio_set_value(dev, offset, value);
}

/**
 * GPIO functions are supposed to be computed from their current
 * configuration, but that's way too complicated in LPC32XX. A simpler
 * approach is used, where the GPIO functions are cached in an array.
 * When the GPIO is in use, its function is either "input" or "output"
 * depending on its direction, otherwise its function is "unknown".
 *
 *	** NOTE **
 *
 * THIS APPROACH WAS CHOSEN DU TO THE COMPLEX NATURE OF THE LPC32XX
 * GPIOS; DO NOT TAKE THIS AS AN EXAMPLE FOR NEW CODE.
 */

static int lpc32xx_gpio_get_function(struct udevice *dev, unsigned offset)
{
	struct lpc32xx_gpio_platdata *gpio_platdata = dev_get_platdata(dev);
	return gpio_platdata->function[offset];
}

static const struct dm_gpio_ops gpio_lpc32xx_ops = {
	.direction_input	= lpc32xx_gpio_direction_input,
	.direction_output	= lpc32xx_gpio_direction_output,
	.get_value		= lpc32xx_gpio_get_value,
	.set_value		= lpc32xx_gpio_set_value,
	.get_function		= lpc32xx_gpio_get_function,
};

static int lpc32xx_gpio_probe(struct udevice *dev)
{
	struct lpc32xx_gpio_platdata *gpio_platdata = dev_get_platdata(dev);
	struct gpio_dev_priv *uc_priv = dev->uclass_priv;

	if (dev->of_offset == -1) {
		/* Tell the uclass how many GPIOs we have */
		uc_priv->gpio_count = LPC32XX_GPIOS;
	}

	/* set base address for GPIO registers */
	gpio_platdata->regs = (struct gpio_regs *)GPIO_BASE;

	/* all GPIO functions are unknown until requested */
	/* GPIO FUNCTION: SEE WARNING #2 */
	memset(gpio_platdata->function, GPIOF_UNKNOWN,
	       sizeof(gpio_platdata->function));

	return 0;
}

U_BOOT_DRIVER(gpio_lpc32xx) = {
	.name	= "gpio_lpc32xx",
	.id	= UCLASS_GPIO,
	.ops	= &gpio_lpc32xx_ops,
	.probe	= lpc32xx_gpio_probe,
	.priv_auto_alloc_size = sizeof(struct lpc32xx_gpio_platdata),
};
