Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516756;
	b=dS7CJnCgRz9rFKZIZqPMhbQaTyoMUaRNNyWblyz/U5K9XAIySv49vho2D5pQwCReY+i7
	 KD3PDz8zBJlVYQSvHj8LNXmvcIBEqz9WJjK4soE+Hy7b6lEsq2GX75nB0NhqrJ5nnnbMO
	 VIIMmgyBjO7kqWrye2Zu/z06TjZ9BL/z+v+bkci/xPSu9CFZfN5EwJyaX4J3QPECLMkYf
	 WrYIJCoB6yEsWTu12qvo9kTAM1DEIVL1BE8LXKqiWzkQHaSIq1naNl10ass0xMdXcFuSj
	 uMZnLZjyjuO30okqHGJktcWwJYtFXgmMuEqGj6hMSWA1KV1GlF8AgEAkQIIssjFQhAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516756;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=nI4e52Acf1U0twvafLH3l00NdIpteq82nRKqiYLBaok=;
	b=0jEsCcfd0ATcKZgjOtDiYwMdsl0K75OyDmb/yLT3fU1LFazd4WnK48WSGDPLHYRHv1zb
	 xMllLzDX7n5HUHsweCyXjmGCb5NcZeq9opp76qV/trbJC0ttdKRt9KkpBWQsUxY9ISAPi
	 JLVaih+Lf6oXMDEAhsZNQmqfJQ+PX2Aib+mjKq9LXZH/43yiZPXKgNhh3F+8kCeOzIYv7
	 oR2vicN1nUOvnFITrOzSxSopDLyvfeVO6M1FVcmIstF/Qu7sQZi3h+JVO6DmmlVT7jOVw
	 6CJVuOh9hQXR8kcK7+zWoxPcllesaHEzp3f6NCBGZ1Fn/0Dlvat8F3XTGQqSYnW4iZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iazj78Bl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6B4606A31E;
	Tue, 24 Nov 2026 10:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iazj78Bl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09DE1F000C0;
	Tue, 24 Nov 2026 10:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795516756;
	bh=nI4e52Acf1U0twvafLH3l00NdIpteq82nRKqiYLBaok=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iazj78BldilxlvS+8TC6x9EdeBTBGmshZKF3EPuo7949rvJOLL0rRH64akv2UvcNC
	 gIUOSiHxZVVniMtrHgvdGNAmDEuE2wqY6BTS19kc7oiXP1qpznm61q4/D26rzRXOMk
	 D6oZaXhM4NqI2GgnxLMssGjz83W7FDWVz3ycIX1rI+GTG0Es9mNiqdqPCBGSt/2+yp
	 I0WjWrUn0MjppAduTrhd//Q8zPGYOmROiGsmd7xIIwzYXiU6PAsAZyVYzgdllesGTq
	 FosVPdkq0hzJ8FFxUwMuPdWBY2hvRKK7p4KJvsepIonw4PNOaGKQ1b/CAIg1ayzBfp
	 H0sQUVpHXnSEQ==
Subject:
 Re: [PATCH v2 1/2] net: phy: motorcomm: add led_brightness_set for YT8521
From: netdev-bot+sashiko@kernel.org
To: amadeus@jmu.edu.cn
Cc: Frank.Sae@motor-comm.com, andrew@lunn.ch, pabeni@redhat.com,
 kuba@kernel.org, edumazet@kernel.org, davem@davemloft.net,
 hkallweit1@gmail.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 10:39:15 +0000
Message-ID: <179551675530.3135.11557257875706105488@kernel.org>
In-Reply-To: <20261120100001.1568757-1-amadeus@jmu.edu.cn>
References: <20261120100001.1568757-1-amadeus@jmu.edu.cn>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new LED callbacks in drivers/net/phy/motorcomm.c reach
  extended registers through the unlocked helpers…
- [Medium] yt8521_hw_led_on_set() may program only part of what looks
  like a 2-bit per-LED force-mode field in YTPHY_LED_GENERAL_CFG_REG…
- [Low] The patch adds a force state in YTPHY_LED_GENERAL_CFG_REG, but
  yt8521_led_hw_control_get() still reads only YT8521_LEDx_CFG_REG (line…
- [Low] The commit message body says only 'Add support for manual
  brightness setting on YT8521/YT8531 PHY.' It does not mention that the…

--

net: phy: motorcomm: add led_brightness_set for YT8521

This adds a led_brightness_set callback for the YT8521 and YT8531 PHYs.
The callback clears the per-LED hardware control config. It then turns the
LED on or off with the force bits in the LED general config register
(0xA00B). It also makes yt8521_led_hw_control_set() clear those force bits
before it programs the trigger rules.

> net: phy: motorcomm: add led_brightness_set for YT8521
>
> Add support for manual brightness setting on YT8521/YT8531 PHY.
> Testing with on/off and heartbeat on the Radxa E20C (YT8531).

[Severity: Low]
This isn't a bug, but the subject only names YT8521. The callback is added
to both the YT8521 and YT8531 entries in motorcomm_phy_drvs.

The body also doesn't mention that yt8521_led_hw_control_set() now clears
the force-enable and force-mode bits in YTPHY_LED_GENERAL_CFG_REG. Before
this patch the hw-control path never touched 0xA00B, so any force state
left by firmware or a bootloader stayed in place.

The only mention is the v2 changelog line "Clear force led status in
led_hw_control_set()". That line is below the --- separator, so it will be
dropped when the patch is applied.

Could the body describe this change as well?

> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> index a87e83fdf590c..5a0cd4d7d6336 100644
> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c
> @@ -271,6 +271,10 @@
>   */
>  #define YTPHY_WCR_TYPE_PULSE			BIT(0)
>  
> +#define YTPHY_LED_GENERAL_CFG_REG		0xA00B
> +#define YTPHY_LED_FORCE_MODE(x)			BIT((x) * 3)
> +#define YTPHY_LED_FORCE_EN(x)			BIT((x) * 3 + 2)

[Severity: Medium]
Is the force mode field really one bit wide? Each LED gets a 3-bit slot
here, but bit x*3+1 (bits 1, 4 and 7) is never defined or touched. That
layout looks like a 2-bit force_mode field at [x*3+1:x*3] next to a 1-bit
force_en.

If so, yt8521_hw_led_on_set() only ORs in BIT(x*3) | BIT(x*3+2):

	mask = YTPHY_LED_FORCE_EN(index) | YTPHY_LED_FORCE_MODE(index);
	if (value)
		reg = val | mask;

The resulting forced mode would then depend on whatever bit x*3+1 already
held. If firmware or a bootloader left that bit set, would brightness on
program mode 0b11 instead of solid on? The LED would then show a different
pattern from what sysfs reports.

I couldn't confirm the field layout from in-tree documentation. Should the
whole mode field be masked and set explicitly?

[ ... ]

> @@ -1775,6 +1779,43 @@ static int yt8531s_config_init(struct phy_device *phydev)
>  	return phy_restore_page(phydev, old_page, ret);
>  }
>  
> +static int yt8521_hw_led_on_set(struct phy_device *phydev, u8 index,
> +				bool value)
> +{
> +	int mask, reg, val;
> +
> +	val = ytphy_read_ext(phydev, YTPHY_LED_GENERAL_CFG_REG);
> +	if (val < 0)
> +		return val;
> +
> +	mask = YTPHY_LED_FORCE_EN(index) | YTPHY_LED_FORCE_MODE(index);
> +	if (value)
> +		reg = val | mask;
> +	else
> +		reg = val & ~mask;
> +
> +	if (reg == val)
> +		return 0;
> +
> +	return ytphy_write_ext(phydev, YTPHY_LED_GENERAL_CFG_REG, reg);
> +}
> +
> +static int yt8521_led_brightness_set(struct phy_device *phydev, u8 index,
> +				     enum led_brightness value)
> +{
> +	int ret;
> +
> +	if (index >= YT8521_MAX_LEDS)
> +		return -EINVAL;
> +
> +	/* clear HW LED setup */
> +	ret = ytphy_write_ext(phydev, YT8521_LED0_CFG_REG + index, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	return yt8521_hw_led_on_set(phydev, index, (value != LED_OFF));
> +}

[Severity: High]
Is the MDIO bus lock held for these extended register accesses? The
kernel-doc for both helpers says:

drivers/net/phy/motorcomm.c:ytphy_read_ext() / ytphy_write_ext()
 * NOTE:The caller must have taken the MDIO bus lock.

But the PHY LED core only holds phydev->lock when it calls the callback:

drivers/net/phy/phy_device.c:phy_led_set_brightness() {
	...
	mutex_lock(&phydev->lock);
	err = phydev->drv->led_brightness_set(phydev, phyled->index, value);
	mutex_unlock(&phydev->lock);
	...
}

So the call chain is:

led_set_brightness()
  phy_led_set_brightness()            <- phydev->lock only
    yt8521_led_brightness_set()
      ytphy_write_ext(LEDx_CFG)
        __phy_write()
      yt8521_hw_led_on_set()
        ytphy_read_ext(0xA00B)
        ytphy_write_ext(0xA00B)

Won't __mdiobus_read() and __mdiobus_write() hit
lockdep_assert_held_once(&bus->mdio_lock) the first time the brightness
changes?

Without the bus lock, the 0x1E page select and 0x1F data accesses can also
interleave with other users of the same bus. Examples are other PHYs being
polled by the state machine, phy_mii_ioctl(), and phy_select_page() or the
_with_lock helpers. Could a write then land in the wrong extended register,
or a read return another register's value? Software blink triggers like
heartbeat call this path repeatedly, so the window keeps reopening.

The read-modify-write of 0xA00B in yt8521_hw_led_on_set() is not atomic
either. Can a concurrent update of the force bits for another LED index be
lost?

The existing hw_control_set/get callbacks already used the unlocked
helpers. This patch adds a new unlocked callback, and also a new unlocked
read-modify-write in yt8521_led_hw_control_set(). The follow-up commit "net:
phy: motorcomm: add missing trigger link for YT8521" doesn't address this,
since it only changes yt8521_led_hw_control_get().

Would it work to take phy_lock_mdio_bus() and phy_unlock_mdio_bus() around
the whole LED operation (both the 0xA00B update and the LEDx_CFG write),
rather than locking each access separately?

>  static const unsigned long supported_trgs = (BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
>  					     BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
>  					     BIT(TRIGGER_NETDEV_LINK)        |
> @@ -1801,10 +1842,15 @@ static int yt8521_led_hw_control_set(struct phy_device *phydev, u8 index,
>  				     unsigned long rules)
>  {
>  	u16 val = 0;
> +	int ret;
>  
>  	if (index >= YT8521_MAX_LEDS)
>  		return -EINVAL;
>  
> +	ret = yt8521_hw_led_on_set(phydev, index, false);
> +	if (ret < 0)
> +		return ret;
> +

[Severity: Low]
This clears the force bits when hw_control_set() runs. Does it run when the
netdev trigger is activated over an LED that was forced on?

Take this sequence. With trigger "none", brightness is set to 1.
yt8521_led_brightness_set() writes LEDx_CFG = 0 and sets FORCE_EN and
FORCE_MODE in 0xA00B.

Then "netdev" is written to the trigger. __led_trigger_set() only turns
the LED off when an old trigger is being removed:

drivers/leds/led-triggers.c:__led_trigger_set() {
	...
		if (trig || !hw_triggered)
			led_set_brightness(led_cdev, LED_OFF);
	}
	...
}

That code sits inside the if (led_cdev->trigger) block, so it doesn't run
when going from "none" to "netdev".

netdev_trig_activate() then sets trigger_data->hw_control = true and calls
set_device_name(), which skips the baseline state during activation:

drivers/leds/trigger/ledtrig-netdev.c:set_device_name() {
	...
	if (!trigger_data->hw_control || led_get_trigger_data(trigger_data->led_cdev))
		set_baseline_state(trigger_data);
	...
}

So yt8521_led_hw_control_set() is never called, and the force bits stay
set. yt8521_led_hw_control_get() only reads YT8521_LED0_CFG_REG + index,
which is 0, so it reports no rules.

The trigger then believes the LED is offloaded with no rules, while the
hardware keeps it forced on. This lasts until a NETDEV_UP or NETDEV_CHANGE
event, or a mode attribute change.

Other PHY drivers such as marvell end up in a similar hw_control state
here. This driver only reaches it because the patch adds the force mode.

Should yt8521_led_hw_control_get() take the 0xA00B force bits into account?

>  	if (test_bit(TRIGGER_NETDEV_LINK, &rules)) {
>  		val |= YT8521_LED_10_ON_EN;
>  		val |= YT8521_LED_100_ON_EN;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120100001.1568757-1-amadeus%40jmu.edu.cn
