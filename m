Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012337;
	b=MMOwbwuxKUYygHWcpM6JL2tNjTwZeMHA1pZnteh8DZM5AL2WcBekARgvlBKGaVia0ROm
	 XOegzKadiK2k4V8fwtYdK9ngZTTi8PRUDToviFTHpAMtmgW7+jxoGYUjfFhr82ZKpDfhm
	 7GPT18v3WoCjV77PXRsvLbMjNwTQtRwMVqj+1NsVGjsNEozlIYJR2aPcDHOEoYQ0Kap+t
	 MfgKiwy1trfrEPaXInlqf3liC/SWGxLXZ/sl1GJTX0EkSVHT2oFJG1Rr/rBaopLTEeufk
	 aDvoByq8IW5v7KtlH7kHXmYHykbPEKN5/IRKEWZf847WL9XtMLG0gfGjSsl5kIRw+9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012337;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=0gn9wLZ33T3rqOAl4UM4rcJq4VGKZHDzazvoGK9niM8=;
	b=GvUgrvbNGbprhS3IKTO/Z4UGGasL6MeBWNtj7yHFLzCPXPKE+ogIJyGuHZbhE2OSoO96
	 z9p4NAfTRKcKAdm4R1/tA/X4/TzbrhUbOP4PzCAyzXlWeBNNE0ksBDDOh5gPVVHrB/Hw6
	 UXmczVy38+Vs+M6w3/RaKez4TrX9qmu1JaAA60l/ivmlCsOiAO78IpMoJh0YaH45slQwR
	 HCTT6eekz4NkIL4G9TlVtEYV6FdO84C35KkD6Y9PKhfHt9ikcc1LZMN/094a6lB/QxFQI
	 zvSzM4tj010braf240zpZryXljTwTia3pu/9xlyyM/jRq03q7aoNGAgeYPOv1o40pyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CeSqWcIP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC8C606A336
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CeSqWcIP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1880F1F000C4;
	Wed, 18 Nov 2026 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012337;
	bh=0gn9wLZ33T3rqOAl4UM4rcJq4VGKZHDzazvoGK9niM8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CeSqWcIPq4zz4a/pZ5oXLbjwBLt09tj6Z4yfqgXvYpEEZk4dBg21gXc5nT6cE10KF
	 ewPhbBeltJfUUl3Wgua7g4VYNkHzuqM3cWnFQBLCL3DfdGqDF+9CpRGVvwa0Y5qYC4
	 q86qy+Ajs6LlVwWQecx2wMciWMI5whbrT8bRmD8xNKmH26dXwKzW0XSwzalxtN6FVx
	 rJ9VY0wq5kx0wlC5BDeHERvAdxEglFbBeftvzTjRph/HjakZd03qpDFwrogx83SAjk
	 5hYtE2vYbJrtyLnV1uDQve9i8cX+y+7dehtj1DRBm46jpVcqMgQsuySefdHU0lG6wu
	 /16rxocljV6Mw==
Subject: Re: [PATCH net 4/4] selftests: drv-net: stats: query timestamping
 stats while down
From: netdev-bot+sashiko@kernel.org
To: dimitri.daskalakis1@gmail.com
Cc: davem@davemloft.net, alexanderduyck@fb.com, kuba@kernel.org,
 kernel-team@meta.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, hmohsin@meta.com,
 mike.marciniszyn@gmail.com, sdf@fomichev.me, bobbyeshleman@meta.com,
 bjorn@kernel.org, leitao@debian.org, horms@kernel.org, almasrymina@google.com,
 vadim.fedorenko@linux.dev, daskald@meta.com, netdev@vger.kernel.org
Date: Wed, 18 Nov 2026 14:32:15 +0000
Message-ID: <179501233564.3136.8246592632106945254@kernel.org>
In-Reply-To: <20261116202957.3601684-5-dimitri.daskalakis1@gmail.com>
References: <20261116202957.3601684-5-dimitri.daskalakis1@gmail.com>
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

- [Medium] The commit message says check_down_ts_stats() should "catch
  drivers that crash or reset [timestamping stats] while the interface…
- [Low] In check_down_ts_stats()
  (tools/testing/selftests/drivers/net/stats.py), a timestamping counter…

--

selftests: drv-net: stats: query timestamping stats while down

This adds check_down_ts_stats() to the drv-net stats.py selftest. The test
reads the ethtool tsinfo timestamping statistics, brings the interface
down, reads them again, and checks that no counter went backwards.

> diff --git a/tools/testing/selftests/drivers/net/stats.py b/tools/testing/selftests/drivers/net/stats.py
> index b08e4d48b15ce..e61db30b51817 100755
> --- a/tools/testing/selftests/drivers/net/stats.py
> +++ b/tools/testing/selftests/drivers/net/stats.py
> @@ -220,6 +220,28 @@ def check_down(cfg) -> None:
>      netfam.qstats_get({"ifindex": cfg.ifindex, "scope": "queue"}, dump=True)
>  
>  
> +@ksft_disruptive
> +def check_down_ts_stats(cfg) -> None:
> +    """Test timestamping stats are not impacted by ifdown"""
> +
> +    req = {"header": {"dev-index": cfg.ifindex, "flags": {"stats"}}}
> +    try:
> +        stats = ethnl.tsinfo_get(req).get("stats")
> +    except NlError as e:
> +        if e.error == errno.EOPNOTSUPP:
> +            raise KsftSkipEx("timestamping not supported by the device") from e
> +        raise
> +    if not stats:
> +        raise KsftSkipEx("timestamping stats not supported by the device")

[Severity: Medium]
Can this test actually detect the reset case that the commit message
describes?

  "to catch drivers that crash or reset them while the interface is down"

The baseline is read without first enabling hardware TX timestamping, and
without sending any packets that request a hardware timestamp. The only
source of these counters is the driver's get_ts_stats():

net/ethtool/tsinfo.c:tsinfo_prepare_data() {
    ...
	if (req_base->flags & ETHTOOL_FLAG_STATS) {
		ethtool_stats_init((u64 *)&data->stats,
				   sizeof(data->stats) / sizeof(u64));
		if (dev->ethtool_ops->get_ts_stats)
			dev->ethtool_ops->get_ts_stats(dev, &data->stats);
	}
    ...
}

In fbnic, ice, idpf, bnxt, wangxun and mlx5, tx-pkts, tx-lost and tx-err
only count TX packets that asked for a hardware timestamp. In a typical
selftest environment the baseline will probably be all zeros.

If the baseline is zero, the ksft_ge(stats2[k], stats[k]) check below
still passes when a driver zeroes its counters in ndo_stop. check_down()
does not have this problem with the same >= pattern, because the qstats
already contain non-zero traffic counts.

The crash-on-query-while-down part does get exercised. Should the test
send some hardware-timestamped TX traffic before reading the baseline, so
that the reset part is covered too?

> +
> +    ip(f"link set dev {cfg.dev['ifname']} down")
> +    defer(ip, f"link set dev {cfg.dev['ifname']} up")
> +
> +    stats2 = ethnl.tsinfo_get(req).get("stats", {})
> +    for k in stats:
> +        ksft_ge(stats2[k], stats[k], comment=f"{k} went backwards on device down")

[Severity: Low]
What happens here if a counter is in the baseline but missing from the
reply after ifdown?

The {} default only helps when the whole nest is missing. That never
happens here, because tsinfo_fill_reply() always emits the stats nest when
the stats flag is set. What can go missing is individual counters, since
tsinfo_put_stat() leaves out unset values:

net/ethtool/tsinfo.c:tsinfo_put_stat() {
	if (val == ETHTOOL_STAT_NOT_SET)
		return 0;
    ...
}

On wangxun ngbe/txgbe, ndo_stop calls wx_ptp_stop(), which sets
wx->ptp_clock to NULL. After that, wx_get_ptp_stats() fills in nothing:

drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:wx_get_ptp_stats() {
    ...
	if (wx->ptp_clock) {
		ts_stats->pkts = wx->tx_hwtstamp_pkts;
		...
	}
}

So stats2 comes back empty and stats2[k] raises KeyError.

ksft_run() still counts this as a failure, and the deferred link up still
runs. However, the output is a Python traceback instead of the "went
backwards on device down" message, and the remaining keys are never
compared.

Would checking k in stats2 (or using stats2.get(k)) with ksft_true() or
ksft_ge() give a clearer failure? The neighbouring check_down() uses the
same qstat2[k] pattern.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116202957.3601684-1-dimitri.daskalakis1%40gmail.com
