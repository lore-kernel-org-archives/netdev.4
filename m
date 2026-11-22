Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360284;
	b=vqMxLu+kXEH3HsDQYFrvsUb75pepcZkaK7Yz4xvOMO03FjxFmRzdWt0KsdmAeycwz03T
	 Xju26+okyeLUxCl984TmJ0ppTjShs2dKIgi4xPnI1LDX/SxXGAAvscc3jUS/JEWfl7XJC
	 jd/KfZ3lmFRW90slefZop+Df6/C4m0W3D2OTEk2KJxbPClXeiEsNxUcZZrkEEpmK0D5Vz
	 h2w8xLZ3zK9nKuR5wC5o/OjJ8qO1EVPqNOKgO2N4dXrZis3APSXBtYAEQFvp/hVsUbeM0
	 BHuS1H7EpP7HLgu1jn3TgocdolttygU3vNq+WeUL4v/HnR+gBh6WlaXIipCCTifhnOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360284;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XiyOxo6AsJWiV2J2ypG5zaxnp/yTc6EsvfTfOjjIUTY=;
	b=GG53RU6PDAgS79I0cihHh7kt8rwgnKMEN3DE59b3V5LeC3m7xOvoDWXiuUng5wcEd2FQ
	 GgdrGSDLLg1CgnlmOb5kAim6MXlYnf38jv+BN6boctvS5JuO7YbCMH2NK26QGnFEpe6+I
	 VsM4Sw3tfuU4/ZwqTelavxGb+8SJd+nDZ0rTnqkunSUJjOcL11WPW4WyEiCZo2IEfODPM
	 VKHTkjEbZOXxTjC5gMpx06XGRhZUi+byB2TVkq3bh02aTeX/w0LGnj93sm4X04PDFWUaW
	 /yx9cHjMc6j5JdtR6+BRyDIQDKkg7bHBEamlKL38CDZkh4j7AJBjEk+BpcpeLEiR5+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NTa1hURP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD58606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NTa1hURP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949B01F000C6;
	Sun, 22 Nov 2026 15:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795360284;
	bh=XiyOxo6AsJWiV2J2ypG5zaxnp/yTc6EsvfTfOjjIUTY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NTa1hURPCFLvNbsJp+9UNmMVkfENiM7tvVr15aO6nTSyc/ZAB1lsRBRjYQTMRt8Wg
	 yGkix8yWAvnhJGncLxKqBvzKmX3ExJIK+7z8dwzDnNPwhfowYJ0wmJ0Y5KPkHZuRjY
	 2LUTzE7nUpVAp/utlugrbjqzoOLKg3KHrxHMcTO1QyVqdjbIJoZheDAynJNmkAPcM8
	 BAhokZUFqSyAPIOiNyxNbYoURmT594wKXABRkUAi6bxz6mw2L45vFLy6sD/cBNILJn
	 rrU7iH+FkWg0Slw7lJOyCLLtyI7kefl86TWiNpuEYFF2GDGWkj3f/Sw6cJynsEKp/Z
	 aO7Rip1e1g/6Q==
Subject: Re: [PATCH net-next] tg3: Add support for boards integrated with
 security SoCs
From: netdev-bot+sashiko@kernel.org
To: pavan.chebbi@broadcom.com
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 andrew.gospodarek@broadcom.com, davem@davemloft.net, edumazet@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com
Date: Sun, 22 Nov 2026 15:11:23 +0000
Message-ID: <179536028313.3135.4205213957657544366@kernel.org>
In-Reply-To: <20261118150247.1145764-1-pavan.chebbi@broadcom.com>
References: <20261118150247.1145764-1-pavan.chebbi@broadcom.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] On Citadel boards, tg3_get_eeprom_hw_cfg()
  (drivers/net/ethernet/broadcom/tg3.c) can leak a registered…
- [Low] The existing comment '/* GPIO1 must be driven high for eeprom
  write protect */' in tg3_reset_hw()…

--

tg3: Add support for boards integrated with security SoCs

This patch adds support for Broadcom NetXtreme NX1 boards that are
integrated with security SoCs. The boards are identified by their PCI
subsystem IDs. On these boards the driver never drives GPIO1, does not
enable EEPROM write protection, and clears WOL_CAP so that Wake-on-LAN is
not advertised.

> diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
> index 95827df4cf6a1..9c431f76d4a52 100644
> --- a/drivers/net/ethernet/broadcom/tg3.c
> +++ b/drivers/net/ethernet/broadcom/tg3.c

[ ... ]

> @@ -10537,7 +10543,10 @@ static int tg3_reset_hw(struct tg3 *tp, bool reset_phy)
>  		tp->grc_local_ctrl |= tr32(GRC_LOCAL_CTRL) & gpio_mask;
>  
>  		/* GPIO1 must be driven high for eeprom write protect */
> -		if (tg3_flag(tp, EEPROM_WRITE_PROT))
> +		if (tg3_flag(tp, CITADEL))
> +			tp->grc_local_ctrl &= ~(GRC_LCLCTRL_GPIO_OE1 |
> +						GRC_LCLCTRL_GPIO_OUTPUT1);
> +		else if (tg3_flag(tp, EEPROM_WRITE_PROT))
>  			tp->grc_local_ctrl |= (GRC_LCLCTRL_GPIO_OE1 |
>  					       GRC_LCLCTRL_GPIO_OUTPUT1);
>  	}

[Severity: Low]
This isn't a bug, but the existing comment says GPIO1 must be driven high,
and it now sits directly above the new CITADEL branch. That branch does the
opposite and leaves GPIO1 undriven.

Could the comment be moved down to the EEPROM_WRITE_PROT branch? Another
option is a short comment explaining that Citadel boards must not drive
GPIO1 because the security SoC uses it as a mailbox.

[ ... ]

> @@ -15231,6 +15272,9 @@ static void tg3_get_eeprom_hw_cfg(struct tg3 *tp)
>  	tg3_flag_set(tp, EEPROM_WRITE_PROT);
>  	tg3_flag_set(tp, WOL_CAP);
>  
> +	if (tg3_is_citadel(tp))
> +		tg3_flag_set(tp, CITADEL);
> +
>  	if (tg3_asic_rev(tp) == ASIC_REV_5906) {
>  		if (!(tr32(PCIE_TRANSACTION_CFG) & PCIE_TRANS_CFG_LOM)) {
>  			tg3_flag_clear(tp, EEPROM_WRITE_PROT);
> @@ -15430,6 +15474,12 @@ static void tg3_get_eeprom_hw_cfg(struct tg3 *tp)
>  			tp->phy_flags |= TG3_PHYFLG_DISABLE_1G_HD_ADV;
>  	}
>  done:
> +	if (tg3_flag(tp, CITADEL)) {
> +		tg3_flag_clear(tp, EEPROM_WRITE_PROT);
> +		tg3_flag_clear(tp, WOL_CAP);
> +		tg3_flag_clear(tp, WOL_ENABLE);
> +	}
> +
>  	if (tg3_flag(tp, WOL_CAP))
>  		device_set_wakeup_enable(&tp->pdev->dev,
>  					 tg3_flag(tp, WOL_ENABLE));

[Severity: Medium]
Can this leak a registered wakeup_source on Citadel boards?

CITADEL is set early, but WOL_CAP is not cleared until the done: label. Two
earlier branches in tg3_get_eeprom_hw_cfg() can therefore still enable
wakeup on a Citadel board.

The first is the NIC SRAM path:

    if (tg3_flag(tp, WOL_CAP) &&
        (nic_cfg & NIC_SRAM_DATA_CFG_WOL_ENABLE)) {
        tg3_flag_set(tp, WOL_ENABLE);
        device_set_wakeup_enable(&tp->pdev->dev, true);
    }

The second is the ASIC_REV_5906 path before goto done:

    if ((val & VCPU_CFGSHDW_WOL_ENABLE) &&
        (val & VCPU_CFGSHDW_WOL_MAGPKT)) {
        tg3_flag_set(tp, WOL_ENABLE);
        device_set_wakeup_enable(&tp->pdev->dev, true);
    }

pci_pm_init() has already marked PME-capable devices can_wakeup, so
device_wakeup_enable() goes ahead. It calls wakeup_source_register(), which
creates a wakeupN device with pdev->dev as its parent. It then attaches the
source to dev->power.wakeup.

After the new block clears WOL_CAP, the else branch that follows runs:

    else
        device_set_wakeup_capable(&tp->pdev->dev, false);

device_set_wakeup_capable() only clears can_wakeup and removes the sysfs
attributes. dev->power.wakeup is left in place. After that,
device_wakeup_disable() returns early:

drivers/base/power/wakeup.c:device_wakeup_disable() {
	if (!dev || !dev->power.can_wakeup)
		return;

	ws = device_wakeup_detach(dev);
	wakeup_source_unregister(ws);
}

So the call from device_pm_remove() never frees the wakeup_source. Its
child device also keeps a reference on pdev->dev, so the pci_dev is never
released after removal.

Before this patch, nothing cleared WOL_CAP after a possible
device_set_wakeup_enable(true) call, so this ordering is new.

Would it work to clear WOL_CAP where CITADEL is set, before either branch
can enable wakeup?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118150247.1145764-1-pavan.chebbi%40broadcom.com
