Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439251;
	b=rbnAGOwTN8SvCPnEZm3qNYhVj49RYwm24cEmWzTPJ2QmlMi8IFXJ9snOJXT5dZh/Q1bi
	 mAOeQOyvmVs4Rc+HiyD2f9CUr54DH2jABgLTHgBjplu0vhJH/vZig1zHm5qvg+pq4MHj9
	 9B6gJ8+9K32KWhCyTbZWvpNLeyAKDjAA89j9PniarDPSPnI3jXqrz1K1DQT2jJwEyPZ1/
	 8A724jxt321e/hX9VqWVD7B2d0tHpDtdyOT4SoPkfDkM2K9NcX2dxyihMWif5KuB8gqeO
	 Z6cV2F0LlXgAA7XsaGKd9Dku++3FaAnwgym/V/lu254XXHAz/Xje0eG1UHA3MgW8MIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439251;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mltZcnDft4HwDtA/qRdYtVQKIWQHKVN2xEodH5O1JHE=;
	b=ZF5EkOaIIUpD90euwFIuTGq5BBIv5D+XsuVP7pNDyOwss7NFeusXcTc75PkjmHtjSIsk
	 5KE3H4KNnWd6ijwXzk8rZEV4OBMnq1Hub2BZ54ehDgJyMEv2wWeU4tlRxXSH+/X5sOXtc
	 mqtpTP2NWe80kNR8EVEKt0dt6ktcDlWpbuBc//csu2PEu3yiAsFPTcnI8sJhrFoTvNBCB
	 BsuRrDgn+HJU68btOm4C2tiWCYGFrMcJYUKNx9cSQYB36Ufb0OpK3QWLvDN2fDSmV2yeX
	 i8/p199ZwRBgZnHsLUno2Tb8qx6qd149bo71SFa8DrWg+k1U4EXPf9AoRXdADEivL6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NiGYhgMT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330E7606A32E;
	Mon, 23 Nov 2026 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NiGYhgMT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21311F000D4;
	Mon, 23 Nov 2026 13:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795439250;
	bh=mltZcnDft4HwDtA/qRdYtVQKIWQHKVN2xEodH5O1JHE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NiGYhgMTuRbcY8f6vFTsqFab5dOHu8gmSn18rF+oKM3GNYU7A5xiaj/kc1D+Qtkm5
	 i9fi+KvTwv9GUUPWdQL0MVIp5gVKtbq3agvq/4tzMUiLcLCQFZQE6pPqSSGDFkZfLc
	 Zwww9jPkGxRWd5Kl2MydObySa05xlMcD7Cp586skHg3ruHkPyR+KtHG/LPvjz1mKAz
	 owgwyjly4ov+HKMEMT6NpclfdjaYTUX7hraUiZC1bJd1wZe30sZVmRfIxq/tvjNY4u
	 rqioShJTVzEPoPFyHAwyV2qQOcRZJ5cndCVe/HawOJ2GGjFuW78vidvhaAKl5PQ8AE
	 w4U/usLVfnlmA==
Subject: Re: [PATCH net] net: via-velocity: Stop the device on shutdown
From: netdev-bot+sashiko@kernel.org
To: roland.waltersson@netinsight.net
Cc: romieu@fr.zoreil.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 kai.heng.feng@canonical.com, rafael.j.wysocki@intel.com,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 13:07:29 +0000
Message-ID: <179543924928.3135.11097619488439916412@kernel.org>
In-Reply-To: <IA0PR17MB668711363A5BE04D1BC3C76B9E792@IA0PR17MB6687.namprd17.prod.outlook.com>
References: <IA0PR17MB668711363A5BE04D1BC3C76B9E792@IA0PR17MB6687.namprd17.prod.outlook.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch adds a .shutdown hook to velocity_pci_driver only.
- [Low] The commit message carries a Fixes: tag for 38f34dba806a ("PM:
  ACPI: reboot: Reinstate S5 for reboot").
- [Low] The commit author is "Roland Waltersson
  <roland.waltersson@netinsight.net>", but the only Signed-off-by…

--

net: via-velocity: Stop the device on shutdown

This commit adds a PCI .shutdown hook to the via-velocity driver. The hook
detaches and closes the interface, then disables the PCI device, so the
chip stops DMAing into its RX rings and raising interrupts after
device_shutdown(). The commit message links an occasional reboot hang on a
congatec conga-EAF board to the ACPI S5 preparation, which commit
38f34dba806a reinstated on reboot.

> and the board is never reset. Not running the S5 preparation on reboot
> avoids the hang.

[ ... ]

> Fixes: 38f34dba806a ("PM: ACPI: reboot: Reinstate S5 for reboot")

[Severity: Low]
Was the new velocity_pci_shutdown() hook tested on the conga-EAF board?
Does the hang go away with it?

The message shows that skipping the S5 preparation avoids the hang. It
does not say whether stopping the velocity chip has the same effect.

It also does not explain how a chip that is still bus mastering, or still
has INTx asserted, would hang during _PTS(5) or the GPE disable.

The cited tg3 commit 2ca1c94ce0b6 fixed a different symptom (AER on
reboot).

The Fixes: tag makes this a stable candidate. Could the changelog say
whether the fix was checked against this hang?

> Signed-off-by: Roland Waltersson <rolwal@netinsight.net>

[Severity: Low]
This isn't a bug, but the Signed-off-by address (rolwal@netinsight.net)
does not match the author address (roland.waltersson@netinsight.net).
checkpatch reports this as a From:/Signed-off-by: email address mismatch.

> diff --git a/drivers/net/ethernet/via/via-velocity.c b/drivers/net/ethernet/via/via-velocity.c
> index 6d7b6f3b46339..3daf7a8dd06eb 100644
> --- a/drivers/net/ethernet/via/via-velocity.c
> +++ b/drivers/net/ethernet/via/via-velocity.c

[ ... ]

> @@ -3241,6 +3267,7 @@ static struct pci_driver velocity_pci_driver = {
>  	.id_table	= velocity_pci_id_table,
>  	.probe		= velocity_pci_probe,
>  	.remove		= velocity_pci_remove,
> +	.shutdown	= velocity_pci_shutdown,
>  	.driver = {
>  		.pm = &velocity_pm_ops,
>  	},

[Severity: Medium]
Only velocity_pci_driver gets a .shutdown hook here. Does
velocity_platform_driver need one as well?

The platform driver binds the same VT6110 MAC through the
"via,velocity-vt6110" compatible. It uses the same velocity_probe() core:

velocity_platform_probe()
    return velocity_probe(&pdev->dev, irq, info, BUS_PLATFORM);

Its registration still has no .shutdown:

static struct platform_driver velocity_platform_driver = {
	.probe		= velocity_platform_probe,
	.remove		= velocity_platform_remove,
	.driver = {
		...
	},
};

The commit message describes the problem without naming a bus: "on
reboot, power off or kexec the chip is left running after
device_shutdown(): it keeps receiving packets into its RX rings by DMA and
raising its interrupt."

On a platform-bound velocity with the interface up, the chip would keep
DMAing into its RX rings and raising its IRQ after device_shutdown(). With
kexec, that DMA can land in memory the new kernel has reused.

Apart from pci_disable_device(), velocity_pci_shutdown() does nothing
bus-specific. Could that part go into a shared helper that a platform
.shutdown hook also calls?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/IA0PR17MB668711363A5BE04D1BC3C76B9E792%40IA0PR17MB6687.namprd17.prod.outlook.com
