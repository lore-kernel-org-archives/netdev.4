Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748427;
	b=zikaDwVfJFQ2N5L+eTezLGlDoIpSKrHiBzSz+G7hHyQMgkbOzINtcWp01tsxj6FbW+Ap
	 dY2T4rpHHiKQjBK4hq/hDrvU50njDC+RJG9O8p0QalYLB/jj35xTRLJyE3czfHviBnaAu
	 6WP968OvmjgQABOsd4phSIIefMG6lnx24kMtiQGlaXtThtifydhdFKjIv9F9S4zrYtNsk
	 JMsckm6qyqyGp13KDhoo2ntRWOiYQkf8PZbkPBfng+Vc6gLCmj29XyFMRlM6ogR4ikF4B
	 LR7jgh5swrb80NacjatO+xN96nDLZq3J+FYwx2IzWltWO+T0cxfjrXNuiTs5JFzrHkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748427;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=aRMLz3ppAQKSOD+SaAUhWG6aoetplzaPJg8cpk5PQPY=;
	b=AfgSCxNIzAOuz6KGG7tvV58aXWCqPVkyd9/dHWUxeQNsNmmauY9ORBuPKPb6/+0dBjr4
	 EQgQNbWqErL2w7jaVHq6jb02I1TC4QqnVXf+z3W/NZLJdcYrmNbGmQDLMLoc8orO835VR
	 FAe8VgGpxqOfihGzKiKMHocrxrci8MbfAlUt1TrnKCeBV7H1bAf2GReG67y3O81h7G005
	 8CQUP2S7TCerqK2zV+U0JiEsXPCybcVVLMnYdn8nVBfO8EMjA53BCZZInpSzStF49NDbq
	 gB+6AlR2Xck+wBZQzrD/0NlrPC7mPdj9cxFNnbOLjBFAZfFqi2hfUJ7kSI3wZRxQDJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LGqUIq2H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B615606A681;
	Fri, 27 Nov 2026 03:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LGqUIq2H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A01A1F0093B;
	Fri, 27 Nov 2026 03:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795748426;
	bh=aRMLz3ppAQKSOD+SaAUhWG6aoetplzaPJg8cpk5PQPY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LGqUIq2HGhs/nkoP3CocEzjTyhsYaHODC25JZ7WVjojOnlgt/sZQvUc377uUWnJRH
	 Nribv+Hcul53Pl0Vtk5dgR/QR6SnM4grdSTHcWu05WQ+B3U0mRVcLhh0fvsxWf1N7u
	 CaI41ZCiNlgrPA4zfYtUxBaF9cxpSV3Jt5kYWrpWA3Wab6+L5MOEt1c/ORnXJMYDA8
	 RWshg/xlC/o4iecjT/k/eXKGrQ7Ae3bn7HU82KeC/vzaUuIoRqfH0N+Npftv2HXJC3
	 M/vJO1R5hgQT0UkpBeiBdzFB9nBUokgOSPP/O2JHdTn13m+5ZEV8ByhshD2skLfsLR
	 7IqWHzftXHdxQ==
Subject: Re: [PATCH net-next v14 12/15] net: dsa: realtek: rtl8365mb: make
 L2/LUT access work on family D
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev,
 o.rempel@pengutronix.de
Date: Fri, 27 Nov 2026 03:00:25 +0000
Message-ID: <179574842518.3135.934343295203099061@kernel.org>
In-Reply-To: <f431815c-e496-49b4-9231-c82694b12032@yahoo.com>
References: <f431815c-e496-49b4-9231-c82694b12032@yahoo.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] On family D, rtl8365mb_setup() sets ds->max_num_bridges = 1
  (drivers/net/dsa/realtek/rtl8365mb_main.c:3859) and treats it as a…

--

net: dsa: realtek: rtl8365mb: make L2/LUT access work on family D

This patch teaches the rtl8365mb table and L2 code about the family D
(RTL8367S-VB) LUT layout. It also uses port-based FID to isolate an
offloaded VLAN-unaware bridge in FID 1 from standalone ports in FID 0.
On family D, fdb_isolation is no longer advertised and max_num_bridges is
set to 1.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index cf06bc94c6029..bf508edc1ad96 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c

[ ... ]

> @@ -3670,9 +3841,23 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
>  		goto out_teardown_irq;
>  
>  	ds->assisted_learning_on_cpu_port = true;
> -	ds->fdb_isolation = true;
> -	/* The EFID is 3 bits, but EFID 0 is reserved for standalone ports */
> -	ds->max_num_bridges = FIELD_MAX(RTL8365MB_EFID_MASK);
> +	if (!rtl8365mb_is_d(priv)) {
> +		ds->fdb_isolation = true;
> +		/* The EFID is 3 bits, but EFID 0 is reserved for standalone */
> +		ds->max_num_bridges = FIELD_MAX(RTL8365MB_EFID_MASK);
> +	} else {
> +		/* No EFID; FID 0 is used by standalone ports and FID 1 by the
> +		 * offloaded VLAN-unaware bridge via port-based FID, so allow
> +		 * at most one offloaded bridge. The bridge number it gets is
> +		 * what rtl8365mb_port_set_efid() takes as "offloaded" to
> +		 * enable port-based FID, so max_num_bridges must not be 0.
> +		 * Bridge numbers are allocated system-wide by DSA, so this
> +		 * does not stop a bridge that already has a number from
> +		 * another switch from being offloaded here as well; such
> +		 * bridges share FID 1 (known limitation).
> +		 */
> +		ds->max_num_bridges = 1;

[Severity: Medium]
Does max_num_bridges = 1 actually mean "at most one offloaded bridge" on
this switch?

DSA treats max_num_bridges as an upper bound on bridge numbers, and those
numbers come from a single system-wide bitmap:

net/dsa/dsa.c:dsa_bridge_num_get() {
    ...
	if (!bridge_num) {
		bridge_num = find_next_zero_bit(&dsa_fwd_offloading_bridges,
						DSA_MAX_NUM_OFFLOADING_BRIDGES,
						1);
		if (bridge_num > max)
			return 0;
    ...
}

If it returns 0, dsa_port_bridge_create() fails with "Range of offloadable
bridges exceeded" and -EOPNOTSUPP, and dsa_user_changeupper() falls back
to software bridging.

Here is one case. Another DSA switch in a different tree already offloads
a bridge holding bridge number 1. A new bridge built only from
RTL8367S-VB ports then gets number 2. Since 2 > 1, it is refused, and this
switch cannot offload any bridge at all, so all bridged traffic goes
through the CPU.

Whether offload works then depends on the order in which unrelated
switches allocated numbers. It can also change as bridges are deleted and
their numbers freed.

The comment above, and this part of the commit message, describe only the
opposite outcome of the same mismatch:

  DSA allocates bridge numbers system-wide, so this does not stop a
  bridge that already has a number from another switch from being
  offloaded here as well; such bridges share FID 1, a known limitation.

rtl83xx_port_bridge_join() passes any non-zero bridge.num to
port_set_efid(), which maps it to FID 1 on family D. It does not enforce
the one-bridge-per-switch limit itself.

Would it work better to keep max_num_bridges at a larger value? On family
D, port_bridge_join could then return -EOPNOTSUPP when another port of
this switch already offloads a different bridge, which would avoid both
outcomes.

At minimum, could the comment and the commit message say that on
multi-switch systems this switch may be unable to offload any bridge?

This code is unchanged at the end of the series, in "net: dsa: realtek:
rtl8365mb: add support for RTL8367S-VB".

> +	}
>  
>  	ds->configure_vlan_while_not_filtering = true;
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/874b29a3-f47f-4bf2-a0f6-2f9fea712f4c%40yahoo.com
