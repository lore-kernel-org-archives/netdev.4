Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789831;
	b=aX/XOZcTwyYjB3NFgyI69JWGVC7IOq5o1GZ/H4f36Mgo51K159u5reQ+FgRbUTyNN15s
	 fdL2adKipyps5f29z3KKWXko35yN9+uSmQz/zrljz7BGX8WvLBTLQql8tjkouRqnPHwtu
	 Bf/8dpnjPKCSTp4B+0GVnSyJ41sUd5wSBhp1NmjErlDjQS1rQdJHsbTx2LbmDllAUnqGo
	 3rgO9V3X/xui+UW6rMNAmzT7jQcjB3SGjABpqiwRgwPvPWKPMm/kFETXmlwFAlRG3pH/4
	 y68soeJ/K+gIdqfW+RHkqzbTtQ0ih+GT2KK0n70qtEK7B7S/D5xKLNPbCmCOkISlnAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789831;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=yI0hKpV2K4KvtWkLJBjk4wFazIPvTqwqOPa5G/W8kos=;
	b=CpvX0kbQ5x0yV1Cq/0zEFSX8WluZky9xJKaUXJkvuwCStLUYPbXA44rH+zPQekjvT0Id
	 yEMWrDii7YF13fdfYnKbFnCyqk8j1fqy6S44spao564nuVXikiSkkduQiv+Si5IG5oucw
	 9UalIEttTLo93MARcw8ethLScwol/IEaGVrl8g2gXP8WFBXgm1ejahgNuJs1tqjpLy2U2
	 AhyrgxZ+jowFWlx0CIHYLbgYCv8lT28NqDrX5NIEUVDHQY42f0zsIC1f8DMHdOq7hF8NB
	 OWwTmRwJC5int5qH2DAi0Y1sBl8Gcd1LARVHh6Me173gDuH5Ptnf4+E3ztfblZT6HcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UIoHa0AE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CCF606A32D;
	Fri, 27 Nov 2026 14:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UIoHa0AE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FCB31F00897;
	Fri, 27 Nov 2026 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789830;
	bh=yI0hKpV2K4KvtWkLJBjk4wFazIPvTqwqOPa5G/W8kos=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UIoHa0AEN/B73X/6sNIpmgs4uOBhm4M/vT55q/p7ewnqQtX0kEXsYJUq1hu1XxMZW
	 IzHndPqV4IuPp7goVK1RKuNwvzr2FsjccDxrUMsn7yrOjqexl5c4awFmDAmkwOM9qv
	 Lw1pjq4nPMOU26w35I9Lbj110eV2JaDXFS0GQ5EksQzZKPScf9gZ+aUIFOwjcX1q+C
	 RBTbtCCSBgXo++J0o5/3Q1EOk+7rpC/lSedh3TCCmSCR8wH+bUN69wUfN/Tc02ni3k
	 objuxBJVBatEf8RvfVmPlDth4efebu2CaNFmGuzSE4kkjBxAflUvxcxcOZcmbbZGQl
	 ggaMIqqjRueXg==
Subject: Re: [PATCH net-next] net: pse-pd: fix bogus budget evaluation
 strategy check in IRQ handler
From: netdev-bot+sashiko@kernel.org
To: kory.maincent@bootlin.com
Cc: o.rempel@pengutronix.de, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org
Date: Fri, 27 Nov 2026 14:30:29 +0000
Message-ID: <179578982915.3135.16459182795663099712@kernel.org>
In-Reply-To: <20261126143012.1595919-1-kory.maincent@bootlin.com>
References: <20261126143012.1595919-1-kory.maincent@bootlin.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says the bogus check "does not prevent the
  TPS23881 from working properly" and sends the fix to net-next for that…
- [Medium] With the early return removed, the simultaneity check at the
  top of pse_set_config_isr() (`(notifs & DISCONNECTION) && ((notifs &…

--

net: pse-pd: fix bogus budget evaluation strategy check in IRQ handler

This patch removes a check in pse_set_config_isr() that compared the PSE
event notification mask against PSE_BUDGET_EVAL_STRAT_DYNAMIC. That
constant and ETHTOOL_C33_PSE_EVENT_DETECTION are both BIT(2). As a result,
any notification that included the detection event was skipped.

> The mistake went unnoticed because ETHTOOL_C33_PSE_EVENT_DETECTION and
> PSE_BUDGET_EVAL_STRAT_DYNAMIC are both BIT(2) and, when only the
> detection event is reported, the function performs no action anyway.
> The check does not prevent the TPS23881 from working properly, but when
> a controller reports the detection event together with other events,
> the whole notification handling is skipped instead of processed.

[Severity: Medium]
Is the statement that the check does not affect the TPS23881 accurate?

The TPS23881 is the only in-tree user of devm_pse_irq_helper().
tps23881_irq_event_handler() reads TPS23881_REG_DET_EVENT once and passes
the same value to both parsers:

drivers/net/pse-pd/tps23881.c:tps23881_irq_event_handler() {
    ...
		ret = i2c_smbus_read_word_data(client, TPS23881_REG_DET_EVENT);
		...
		val = ret;
		ret = tps23881_irq_event_detection(priv, val, notifs,
						   notifs_mask);
		...
		ret = tps23881_irq_event_classification(priv, val, notifs,
							notifs_mask);
    ...
}

Both parsers OR into the same notifs[i]. The retry loop in
tps23881_irq_handler() also collects several interrupt rounds into the
same notifs[] word. A detection-done event and a class-done event for one
port can therefore arrive together as DETECTION | CLASSIFICATION. Whether
this happens depends on hardware timing.

The TPS23881 sets supp_budget_eval_strategies to
PSE_BUDGET_EVAL_STRAT_STATIC. That makes pse_pw_d_is_sw_pw_control()
true, so pse_isr() calls pse_set_config_isr().

Before this patch, that mask hit the BIT(2) early return. The
CLASSIFICATION branch never set isr_pd_detected and never called
_pse_pi_delivery_power_sw_pw_ctrl(). No SW_PW_CONTROL_ERROR was reported
either.

Under software power control nothing else powers the port. A later admin
enable cannot recover it, because pse_pi_enable() only delivers power when
isr_pd_detected is set:

drivers/net/pse-pd/pse_core.c:pse_pi_enable() {
    ...
		if (pcdev->pi[id].isr_pd_detected) {
			struct netlink_ext_ack extack;

			ret = _pse_pi_delivery_power_sw_pw_ctrl(pcdev, id, &extack);
		}
    ...
}

The note below the cut line says the fix goes to net-next because the
TPS23881 works fine with the check. Since a classified PD on an
admin-enabled TPS23881 port could be left unpowered, should this go to net
instead, so that the Fixes: tag leads to a stable backport?

> diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
> index 0477cf6787bd3..ae31175921a07 100644
> --- a/drivers/net/pse-pd/pse_core.c
> +++ b/drivers/net/pse-pd/pse_core.c
> @@ -1291,9 +1291,6 @@ static int pse_set_config_isr(struct pse_controller_dev *pcdev, int id,
>  {
>  	int ret = 0;
>  
> -	if (notifs & PSE_BUDGET_EVAL_STRAT_DYNAMIC)
> -		return 0;
> -
>  	if ((notifs & ETHTOOL_C33_PSE_EVENT_DISCONNECTION) &&
>  	    ((notifs & ETHTOOL_C33_PSE_EVENT_DETECTION) ||
>  	     (notifs & ETHTOOL_C33_PSE_EVENT_CLASSIFICATION))) {

[Severity: Medium]
With the early return gone, the DETECTION part of this check can now be
reached. A DETECTION | DISCONNECTION mask used to return 0. It now
returns -EINVAL, and pse_isr() reports that to user space:

drivers/net/pse-pd/pse_core.c:pse_isr() {
    ...
			ret = pse_set_config_isr(pcdev, i, notifs);
			if (ret)
				notifs |= ETHTOOL_PSE_EVENT_SW_PW_CONTROL_ERROR;
    ...
}

Is this change to the ethtool PSE netlink notifications intended? The
commit message does not mention it.

Can the TPS23881 produce this mask?

- tps23881_irq_event_over_current() ORs in OVER_CURRENT | DISCONNECTION.
- tps23881_irq_event_detection() ORs in either DETECTION or
  DISCONNECTION, depending on the signature result.
- tps23881_irq_handler() merges several interrupt rounds into one
  notifs[] word and loses their order.

An over-current shutdown followed by re-detection could be merged this
way. So could an invalid detection followed by a valid one.

In both the old and the new code, the DISCONNECTION is then not
processed:

- _pse_pi_disable() is not called.
- The PI power budget is not released.
- isr_pd_detected stays true even though the hardware has already turned
  the port off.

A later CLASSIFICATION would then allocate budget again without freeing
the old allocation.

DETECTION on its own takes no action in pse_set_config_isr(). The
c33-pse-event-detection uAPI doc also only says that a detection process
occurred on the PSE.

Should DETECTION be dropped from this conflict check so that the
DISCONNECTION gets handled? The commit message says combined events are
now processed, but this combination still is not.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126143012.1595919-1-kory.maincent%40bootlin.com
