Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795734009;
	b=1y2KTeOCiYI5tI/b9WXl3rOKN1MpV34he4mB5+tLz9LqTn+0rX9k8YPPl1XJFpJrL/t+
	 nlRbvqHJUlXWKvLoxh1E7tCAWV72uq2sCDANKDYlomhDWGjBLLT9dWzrorZvdXRmcPy2g
	 hKvhJA1yAeBvaL4Zv8XAzpAbzY0o26694IMbnG4E4MEAyj1RoguAFVVJ2GDsNv+u3jxJ/
	 KEZHILA975hJEPSzh4btL3xPY9LOoStDF8BSl5sHkitdOvEBRZlGawizWzNleELpq9kVY
	 PD0Ua09rBL35V0xD+FN3fNJ9TRUBpwFNZywuph+RYYG7Un0zks0tygxcxSwJ286U0+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795734009;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=nsTRjSTVyMy0HrGE0M7XcfK7MfniVZMdtJ/IkyyInRU=;
	b=CkmtSNte1VvMRmiqDJLRrBKdnuCdXFtzFhz0USOM9CF5MTsxQAykNqpVwVixJBB11Xg4
	 LUvEtm8v4s+rPCsFhsBWKvcVrTrrrY6Ms6o8SQ2ZoSf/0IcFl3nnPpRknrFrygCXcl8FX
	 octr7KN1DC6tNIkUNC7WiJPfIGsqCQWn1zEQVhk7nYh2mcDSTKcgZCxlVfR1v2IZ9CayY
	 xB9RwkQ8Z18lXzyP0yZUsxIX9UGf5UfLTPjfxVbAVFZme3NmoAQW5cV7XtOVYlBzbpZeI
	 2bKjwk5asMQXRLDOLln/5cuBk+6w7TNtRQY0em4cq53MR4B2/wtYvr+vtT5pKGhyXsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IzBqj6dw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82630606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 23:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IzBqj6dw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3055D1F00897;
	Thu, 26 Nov 2026 23:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795734009;
	bh=nsTRjSTVyMy0HrGE0M7XcfK7MfniVZMdtJ/IkyyInRU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IzBqj6dwSZb0tC4sMrxygBEk9YmLxRj6gcEsVSI5OLXm1wrMmqNr0Y4qRCWwmDlHr
	 fpZ2o+6zKNFYLM5gWB+/XXKC7VZ4Tu+P9beY2kQKlKk3mUSjE1f+tecJRsRXjVHRgF
	 5XZmK0du5ghx9bsut3w6cFhKrLg6CJ06rCdUjfeYSaZVL6y0v4CVEkzKpg1rUs5g6w
	 RNQ3TK1Mb/9l7RuyLxI6Kj+OH2SHShz1bxiKvRJpvCQjGelIDrw1rYfo4YDsdu1SoH
	 saQtzUyHXs3fP+AoeJ5fB1EKDLiTDe7BTfzBiOVWn0s+IzxLB2x6do3Rs69gWe93m5
	 QPa8+ElcCfbrw==
Subject: Re: [PATCH net 4/5] ice: remove redundant cross-timestamp PTP command
From: netdev-bot+sashiko@kernel.org
To: anthony.l.nguyen@intel.com
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, willemb@google.com,
 netdev@vger.kernel.org, grzegorz.nitka@intel.com,
 przemyslaw.kitszel@intel.com, aaron.ma@canonical.com,
 maciej.machnikowski@intel.com, jacob.e.keller@intel.com,
 richardcochran@gmail.com, sergey.temerkhanov@intel.com,
 milena.olech@intel.com, horms@kernel.org, aleksandr.loktionov@intel.com,
 ayush1x.singh@intel.com
Date: Thu, 26 Nov 2026 23:00:07 +0000
Message-ID: <179573400778.3135.2988543819162963844@kernel.org>
In-Reply-To: <20261125224428.4126195-5-anthony.l.nguyen@intel.com>
References: <20261125224428.4126195-5-anthony.l.nguyen@intel.com>
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

- [Medium] In ice_capture_crosststamp()
  (drivers/net/ethernet/intel/ice/ice_ptp.c), the patch drops the…

--

ice: remove redundant cross-timestamp PTP command

This patch changes ice_capture_crosststamp(). It no longer programs
GLTSYN_CMD with READ_TIME before the ART/device cross-timestamp capture,
and no longer clears it with NOP afterwards. The commit message says the
hardware never needed the READ_TIME step, and that writing the shared
GLTSYN_CMD register only adds a potential race.

> diff --git a/drivers/net/ethernet/intel/ice/ice_ptp.c b/drivers/net/ethernet/intel/ice/ice_ptp.c
> index 8908b4f3db353..db1d0e42ae52c 100644
> --- a/drivers/net/ethernet/intel/ice/ice_ptp.c
> +++ b/drivers/net/ethernet/intel/ice/ice_ptp.c
> @@ -2183,9 +2183,6 @@ static int ice_capture_crosststamp(ktime_t *device,
>  	/* Snapshot system time for historic interpolation */
>  	ktime_get_snapshot_id(ctx->snapshot_clock_id, &ctx->snapshot);
>  
> -	/* Program cmd to master timer */
> -	ice_ptp_src_cmd(hw, ICE_PTP_READ_TIME);
> -

[Severity: Medium]
The commit being fixed describes this step as a requirement seen on
hardware, not as an assumption. 88c360e49f51 ("ice: Support
cross-timestamping for E823 devices") says:

    The GLTSYN_CMD register must be programmed with the READ_TIME
    command. Otherwise, the cross timestamp will always report a value of
    zero for the PTP hardware clock time.

This commit message only says:

    It was assumed that this change was needed for E823 devices, which
    turned out to be not true.

Is there a datasheet, erratum or firmware/NVM detail that explains why the
earlier observation was wrong? Was testing done across all E823 silicon
steppings and NVM versions?

If the requirement still holds on some E823 configuration, the capture
would still look successful, because ctl_active clears. The zero PHC time
would then be returned without any check:

	ts_lo = rd32(hw, cfg->dev_time_l[tmr_idx]);
	ts_hi = rd32(hw, cfg->dev_time_h[tmr_idx]);
	ts = ((u64)ts_hi << 32) | ts_lo;
	*device = ns_to_ktime(ts);

ice_ptp_getcrosststamp() selects this routine for ICE_MAC_GENERIC,
ICE_MAC_GENERIC_3K_E825 and ICE_MAC_E830, so every device that supports
cross-timestamping goes through this path. phc2sys uses
PTP_SYS_OFFSET_PRECISE by default when it is available. A PHC time of 0
would show up there as a very large offset and could make it step the
clock.

Separately, this patch carries a Fixes: tag and will probably go to
stable. Could the commit message describe the user-visible symptom of the
old code? Right now it only calls it "a potential race source".

The race looks real. ice_capture_crosststamp() holds only the
cross-timestamp semaphore (PFHH_SEM / E830_PFPTM_SEM). It does not hold
the PTP semaphore that ice_ptp_lock() takes in the settime, adjtime and
incval paths, which also program GLTSYN_CMD.

So the old READ_TIME/NOP writes could overwrite a prepared INIT_TIME,
ADJ_TIME or INIT_INCVAL command, and a clock adjustment would be lost
without any error. Could that be stated in the commit message for
backporters?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125224428.4126195-2-anthony.l.nguyen%40intel.com
