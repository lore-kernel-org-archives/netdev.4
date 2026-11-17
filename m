Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950061;
	b=0amkrrFt+FJDyunt8zUcNI8IOjfaPWbRx3ZX81ksK4Ao5Y9eLMPmFIxzfv6Qn4IFihPc
	 JVIxVtKLYVmmuysYj6eszVW9OZ83GzdaycuixHnE9BKvp64A/dD458Mae/jvsL0/Mzaqs
	 qmWnIIEI9tsgYiADZ8BdwB82uUdl4m6yPwn3+pkoCMbJZFBTq+RBw4MsbpZ7R/6Mfr3zh
	 1wCsY226RPlM4GdU71VsJTEogM6Mg2eqbZUpmY2XciWbTiYZwHPpFflqZSnTnvywuIeuL
	 ZrTLRBYlGFhwK2kKTyjB79t+fEsn0OOpxL3Lx/CTfzFyn/VrbysFsjrqeYbTqOOkeBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950061;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TcpFUjEcAbKNKX1+Kz1Nz7s9gX1dNDQMX7S3PRCPz44=;
	b=h+6pKjrm/Uxq7sgrLYBkgojovkeGPOJx2ognId6pZ5cbQlqXXJkLJ90b3UBn11/wJlwX
	 kiN0ArGFk2bR/8qmAD4RcW33HfhiwMh+oZXfC1CTq/K81Ovx2hGWHhwzVO5OEBgqbjdvF
	 iTmTssObIn6q3985CBaCGygBTD2QJQ6d36YdEUo31MFlGrCunxEX/EyrBXJe+8JP3lKvr
	 qVs2Md7e/6MpM1QOdk/uLwpjW7cci/cCaom8ROHrfmu2icT/gF+HZZHxx8gnTG0KF9NNr
	 klY1cBcJfmTSvyVq3qGUhlKuCJ7ONC5TPG0bQedhbjBK2LGVdZHW9oHwG52bh6RkJDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UabMZzBb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CE3606A334
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UabMZzBb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC0D1F000C4;
	Tue, 17 Nov 2026 21:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794950060;
	bh=TcpFUjEcAbKNKX1+Kz1Nz7s9gX1dNDQMX7S3PRCPz44=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UabMZzBb8bXiFkATDfhjF8FI8uNKBN/kJmMa5x+zXfaVkuL3BxLhY9N5SY2QAiWxc
	 WTdcC7D/viMKcvv2dmKgEknub1FP833b5YuP9fFb0s3LwS3ayNH8ySHqfAV98XN5UZ
	 FfeGMZ9pGDjVEwSa6/BthCmldBadw7qCVEDtvLVcqpxnrzT/0YRwSsJJ2XYT2dnxG3
	 HQ6vRmd3u7e+ykw3iidC7hjnUEwNyeaNE2ezIBfZHpT/Ds3Zfe1FAXmZ85RpMYmAvs
	 3qUPa7Q0tmKPdA5lF2nCIuwjSllYJx40NxmrauoANE/0kCmmiPtd+0cSqp2MuQ930M
	 7t4ta+Q2VVzDg==
Subject: Re: [net PATCH 2/6] fbnic: Do not accumulate HW stats from failed
 register reads
From: netdev-bot+sashiko@kernel.org
To: alexander.duyck@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, kernel-team@meta.com, kuba@kernel.org,
 pabeni@redhat.com
Date: Tue, 17 Nov 2026 21:14:19 +0000
Message-ID: <179495005990.3136.15414982968445441738@kernel.org>
In-Reply-To: <179460249371.8819.4646491882671802455.stgit@ahduyck-xeon-server.home.arpa>
References: <179460249371.8819.4646491882671802455.stgit@ahduyck-xeon-server.home.arpa>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete: `fbnic_pcs_rsfec_stat_rd32()` in
  drivers/net/ethernet/meta/fbnic/fbnic_mac.c still adds failed reads…
- [Low] The commit message describes the failed-read symptom accurately
  only for the 64-bit counters.

--

fbnic: Do not accumulate HW stats from failed register reads

This commit changes the fbnic HW stats helpers so they skip updating the
running totals once a failed register read has disabled CSR access. The
check is added to fbnic_hw_stat_rd32(), fbnic_hw_stat_rd64(),
__fbnic_mac_stat_rd64() and fbnic_mac_stat_rd32().

> When a register read fails, as it does for every read once a DPC
> containment event takes the link down, the fbnic_rd32 function returns
> all ones and disables CSR access, so every later read also returns all
> ones until the device is recovered. A stats read in that window adds the
> difference between all ones and the last value to the total, which
> subtracts the counter's whole value since the last rebase.

[Severity: Low]
Does this description hold for the 32-bit counters?

In fbnic_hw_stat_rd32() and fbnic_mac_stat_rd32() the delta is computed
in u32:

	stat->value += new_reg_value - stat->u.old_reg_value_32;

When new_reg_value == 0xffffffff, this gives 0xffffffff - old. That value
is zero-extended and added to the u64 stat->value. So the 32-bit counters
(TMI/TTI/RPC/RXB drops, per-queue HW drops, 32-bit MAC stats) would jump
forward by nearly 2^32 instead of dropping.

Only the 64-bit helpers wrap the total downward, because fbnic_stat_rd64()
returns ~0ULL there. The code change looks correct for both widths. Could
the commit message also mention the forward jump in the 32-bit counters?

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
> index 16271c717a5aa..2aacbf0a6af40 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c

[ ... ]

> @@ -417,6 +421,10 @@ static void fbnic_mac_stat_rd32(struct fbnic_dev *fbd, bool reset, u32 reg,
>  	u32 new_reg_value;
>  
>  	new_reg_value = rd32(fbd, reg);
> +	/* A failed read disables CSR access and returns all ones */
> +	if (!fbnic_present(fbd))
> +		return;
> +
>  	if (!reset)
>  		stat->value += new_reg_value - stat->u.old_reg_value_32;
>  	stat->u.old_reg_value_32 = new_reg_value;

[Severity: High]
Should fbnic_pcs_rsfec_stat_rd32() in this same file get the same check?

It reads the clear-on-read FEC/PCS counters and never calls
fbnic_present():

drivers/net/ethernet/meta/fbnic/fbnic_mac.c:fbnic_pcs_rsfec_stat_rd32() {
    ...
	pcs_rsfec_stat = rd32(fbd, reg) & 0xffff;
	pcs_rsfec_stat |= rd32(fbd, reg + 1) << 16;

	/* RFSEC registers clear themselves upon being read so there is no
	 * need to store the old_reg_value.
	 */
	if (!reset)
		stat->value += pcs_rsfec_stat;
}

After fbnic_rd32() clears uc_addr0, both reads return ~0U, so
pcs_rsfec_stat ends up as 0xffffffff. These counters have no baseline to
subtract. As a result, corrected_blocks, uncorrectable_blocks and every
SymbolErrorDuringCarrier lane would grow by about 4G on each stats poll
while the device is unreachable.

One path that reaches it:

fbnic_get_stats64()
  fbnic_get_hw_stats()
    __fbnic_get_hw_stats32()
      fbnic_get_phy_stats32()   /* reset == false */
        fbnic_mac_get_fec_stats() / fbnic_mac_get_pcs_stats()
          fbnic_pcs_rsfec_stat_rd32()

The service task reaches it the same way through fbnic_get_hw_stats32(),
and so does ethtool through fbnic_get_fec_stats().

dev_get_stats() does not check netif_device_present(). A read of
/proc/net/dev during a DPC/AER outage, or after fbnic_pm_suspend(), would
therefore hit this path.

fbnic_reset_hw_stats() calls these readers only with reset == true. That
skips the add but does not rewind stat->value, so the inflated totals
would remain after recovery.

Would adding the same "if (!fbnic_present(fbd)) return;" after the two
reads in fbnic_pcs_rsfec_stat_rd32() close this gap?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179460241885.8819.7179935130629202331.stgit%40ahduyck-xeon-server.home.arpa
