Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798084;
	b=DOwsSZ/BIxRtdzpiNW5O0oYjLMuKuyfmmCVaXmabmaipZ1I/l8P0CVE23IVpK7EdryDF
	 iMh4GSEhQS9iIeg4fwXfJG3BcnlUZ1GCC/2bGG50dKjPTIS6PyqPuIE36HBjOcNISOtRK
	 h7O1K6jriDSW14L0S1fr2S0Rz/MJpLPEApQjFO9Ayk2s0PMVE3QwnH2fhdNgwV9Zm6hZK
	 LLd00YC+ws9SOpa2OUfeoXNtq9NvjlzUG4N+0rNVnSj96afKSSEE2OvmgXk90tThQbH/G
	 isaRLAlAlp3fXaXOLeVHQkLtPcQOfME4Fue+d7oWDYBfd4oBo1U6qKXnayWc2KEQoOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798084;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Gxrq+wTNFJE4UAmtLE4bDuZwtUUzAFZI+KbF7SkCIZk=;
	b=JPPr+NSG6n7JN83QA/Kf8mO5A8mowUurEYJlsGYVs6QrIDztOMDBgo/HktggFbDxwvw1
	 WSz+sqSmXBK0+AQk0Azk0CU2+cViOGYyj1sorAMitq2p+8/4awqVo2psGLxGcXmKRtpRL
	 LjfB4dE+KhoXQdkVKW0wxpk//0odunoz4fOT+dkZq+ZCsoxmfQmCy+PP6iSRZDVm81/op
	 q8deTAfXIfWdcC3Ga8gqgJR3unO+Rz5aH1kkt4TzSi9CH1Vu/Ck0Yj8iMpJD57sqv5rYN
	 sNwuGJ1y59QKnvyvx24BNlnBBIir0fk0hk2MjVjnYcJoDovupf1iFRoqyytt+/k5J2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GuHdK9hx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496AF606A32F;
	Fri, 27 Nov 2026 16:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GuHdK9hx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9F41F00897;
	Fri, 27 Nov 2026 16:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798083;
	bh=Gxrq+wTNFJE4UAmtLE4bDuZwtUUzAFZI+KbF7SkCIZk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GuHdK9hxhorwyGDf/NWUtSntyUl7kZOsP2iWa42j0SBqsrwGmxXSdTLZhfu2Gr9/e
	 LdNHipNIexo6WqI8BpRwTjf8gNWoFX04wVcK3aPLavtG/kDO3LolnKjxuzQDQkjR4c
	 MBbkCv9n5ElUYGUqE0WnymJSXx6B5H7AYU0WN6qIqIvyY5yepqZjbjmSHm5rXKGDlO
	 v4J1iKitJ9iV803UpK7ebhVMC1rZx8wBRQGFv8pN0IaLFMIRIGzFoCih/Z806swSbt
	 sKVb+QaGc1G0oDAN9OhdT1WgzEsBfoYc9f2gRwlsJBdZSWJbI4dutaF+pWorN4wZiB
	 7PZN4nxyjasrg==
Subject:
 Re: [PATCH net v6 4/8] ptp: ocp: restore disabled SMA inputs when binding
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, richardcochran@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 vladimir.oltean@nxp.com, vadim.fedorenko@linux.dev, andrew@lunn.ch,
 linux-kernel@vger.kernel.org, arkadiusz.kubalewski@intel.com,
 jiri@resnulli.us, jonathan.lemon@gmail.com
Date: Fri, 27 Nov 2026 16:48:02 +0000
Message-ID: <179579808276.3135.5382400825629748441@kernel.org>
In-Reply-To: <20261126-timecard-driver-v6-4-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-4-ahmadexp@gmail.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message describes a hardware bug that does not
  exist.
- [Medium] The code that disables an SMA input and the new restore code
  in ptp_ocp_sma_fb_init() read the hardware state differently for…
- [Low] There are three submission metadata problems.

--

ptp: ocp: restore disabled SMA inputs when binding

This commit adds a loop to ptp_ocp_sma_fb_init(). At probe time the loop
reads each SMA selector through ptp_ocp_sma_fb_get() and sets
bp->sma[i].disabled when SMA_ENABLE is clear. It also forces disabled
pins to SMA_MODE_IN, so they show as "IN: None" after a rebind.

> The SMA disable state is stored in software and is lost when the driver is unbound. The hardware selector may therefore route an input after a rebind even though userspace had disabled it.
>
> Apply the disabled state during SMA initialization so the hardware mux and software state agree after binding. This fix is independent of DPLL reporting.

[Severity: Medium]
Is this description accurate? The disable path already writes the
disabled state into the hardware input selector:

drivers/ptp/ptp_ocp.c:ptp_ocp_sma_store_val() {
    ...
	if (sma->disabled)
		val = 0;

	if (mode == SMA_MODE_IN)
		val = ptp_ocp_sma_set_inputs(bp, sma_nr, val);
    ...
}

Neither ptp_ocp_detach() nor the probe path writes sma_map1 or
sma_map2. The probe path goes through
ptp_ocp_sma_init()->ptp_ocp_sma_fb_init(). So the cleared input selector
should survive an unbind and rebind. The new loop also only reads
hardware, through ptp_ocp_sma_fb_get(). It updates bp->sma[i].disabled
and bp->sma[i].mode but writes nothing to the mux.

Before the patch, the user-visible problem looks like a reporting one. A
disabled SMA1/SMA2 has its input field cleared, so BIT(15)/BIT(31) of
sma_map1->gpio1 is clear and the pin is detected as an output:

	bp->sma[0].mode = reg & BIT(15) ? SMA_MODE_IN : SMA_MODE_OUT;
	bp->sma[1].mode = reg & BIT(31) ? SMA_MODE_IN : SMA_MODE_OUT;

sysfs then reports it as an output. A disabled SMA3/SMA4 is reported as
an input without "None".

On "independent of DPLL reporting": ptp_ocp_dpll_direction_get() takes
the direction from sma->mode:

	*direction = sma->mode == SMA_MODE_IN ?
				  DPLL_PIN_DIRECTION_INPUT :
				  DPLL_PIN_DIRECTION_OUTPUT;

The patch forces SMA_MODE_IN for disabled pins. After a rebind, the DPLL
netlink direction for a disabled SMA1/SMA2 therefore changes from OUTPUT
to INPUT.

Could the commit message describe the reporting fix and this change to
the DPLL-reported direction instead?

> A coding assistant helped validate the rebind behavior and prepare the source-derived regression test and changelog.

[Severity: Low]
The patch only touches drivers/ptp/ptp_ocp.c, so the regression test
mentioned here isn't included. Can it be posted for reviewers?

This isn't a bug, but the From: name (ahmadexp) doesn't match the
Signed-off-by: name (Ahmad Byagowi), and checkpatch will flag that. The
body paragraphs are also not wrapped at 75 columns.

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 284908c6abc22..aa18c5e5eba45 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -2932,6 +2932,14 @@ ptp_ocp_sma_fb_init(struct ptp_ocp *bp)
>  		reg = ioread32(&bp->sma_map1->gpio2);
>  		bp->sma[2].mode = reg & BIT(15) ? SMA_MODE_OUT : SMA_MODE_IN;
>  		bp->sma[3].mode = reg & BIT(31) ? SMA_MODE_OUT : SMA_MODE_IN;
> +
> +		for (i = 0; i < OCP_SMA_NUM; i++) {
> +			reg = ptp_ocp_sma_fb_get(bp, i + 1);
> +			bp->sma[i].disabled = !(reg & SMA_ENABLE);

[Severity: Medium]
For SMA1/SMA2, can this miss a pin that was disabled while it was
already in input mode?

If the pin is already SMA_MODE_IN, ptp_ocp_sma_store_val() skips the
direction switch, so only the input selector is cleared:

	if (mode != sma->mode) {
		if (mode == SMA_MODE_IN)
			ptp_ocp_sma_set_output(bp, sma_nr, 0);
		...
	}
	...
	if (sma->disabled)
		val = 0;

On rebind, the SMA1/SMA2 direction comes only from the input-enable bit
in sma_map1->gpio1, so the disabled pin is first classified as
SMA_MODE_OUT. Because of that mode, ptp_ocp_sma_fb_get() then reads the
output register:

	else
		gpio = sma_nr > 2 ? &bp->sma_map1->gpio2 : &bp->sma_map2->gpio2;

disabled is set only if SMA_ENABLE is also clear in sma_map2->gpio2.

Suppose the output half has SMA_ENABLE set while the pin is in input
mode. Then the "IN: None" setting is not restored, and the pin comes
back as an enabled output, the same as before the patch.

Every direction switch in the driver clears the other half, so this
state would have to come from the firmware power-on defaults for
sma_map2->gpio2. I couldn't verify those defaults. SMA3/SMA4 don't seem
affected, because their direction comes from the output-enable bit.

Should the restore check the input selector for these pins? Or should
the disable path also clear the output half?

> +			/* Both buffers disabled: report None. */
> +			if (bp->sma[i].disabled)
> +				bp->sma[i].mode = SMA_MODE_IN;
> +		}
>  	}
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-timecard-driver-v6-0-ahmadexp%40gmail.com
