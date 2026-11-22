Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.38.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374345;
	b=soyg6V8iUnrGcuCSB+GVasAu6jN4GeqcS1LwToYP9x7UbNB16C+dU6XIOocO8xoSs/PN
	 naKT4zu+opsVm2hgXdV38MXl7ZF1DjRrmOTSRmOrdP6P+ZK4L84xtmT3WAaBOTn/Z2+wC
	 dygihHZ2bP8QyioNuCsVe4x/f9cJIUgVO/Bezi2Fd2F+j6Swl7+6PBKKy9kKwAukPvKll
	 HRGclcobZpn5IUbc6fEaPKhW81xhF/1ijfjk8SV2ICWuxgckLedzcMPjVXgnUzJs9AMfa
	 zwk2g9Ckl8OO7jD8xWzHljeEcaoopJc1mXrFYMNFTleFBHEdbmMa8lQn2ZZ7LKXXmFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374345;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rrkxO7d1sWyri95f/NdbSifRQhkw/w+K4C7xt5BAaQM=;
	b=RvT+voxXVMZFu0DREYEo7RpJUQdx+qSIA/mPk17QPg3vN54ES/UwZv1AUW5gXovL4mgb
	 iCuPRVU3YDetOh+eIRJhKfv7fjBJXEt3Zlf7YGXGBdfbOBKug8gB97Tt5LB7NtGstDM8H
	 x51Y00/CC/5FkgTmBYETKYujlC/qrg/9kuPyqKiau1KNgHTYjvbFlrpvPs5WARPRNa7Xf
	 5taXmaGH7vnvvHTLerSXXIM01ojvRzq2nTMqdFGtZlzEM2vP0RuHSqL3+Jgt/VO9Ooft9
	 v6JvzdSAjN1cw1FFCkGIIus/4oxFdaTqxzk/DmQoE5eLMXa1u5k/CHyHy8CqBPD/vEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=loljews.com;
	spf=pass smtp.mailfrom=loljews.com;
	dkim=pass header.d=loljews.com header.i=@loljews.com header.a=rsa-sha256 header.s=mail header.b=C0nwrHYh;
	arc=none smtp.remote-ip=54.38.221.178
Received: from mnc015mcc432.ss7-reroute.local (unknown [54.38.221.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C2A606A332
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 19:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C2A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=loljews.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loljews.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=loljews.com header.i=@loljews.com header.a=rsa-sha256 header.s=mail header.b=C0nwrHYh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=loljews.com; s=mail;
	t=1795374333; bh=rrkxO7d1sWyri95f/NdbSifRQhkw/w+K4C7xt5BAaQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C0nwrHYh+/ftXHfJzf1Y3hznCQIk92eEcI0Nzw4Dea8YBn33n1D2lnAt761n2mh/x
	 hbKRe3yyQldoLCc1hIVswa0JOZSzcQLOdEZ7cZkopuZtdTF0BxhM5azT4ZPKdVCeET
	 jZVFN4aWFOWqxe+odjOE47mYIyLbsevQja6xVK5R0Un+LD3Y88vBc/TYFa7QPNwtZm
	 rkIWe9gyZYaPyB2WKOZOZt4K0r4BMLBB45GxN8BLbD5AsKdNchTgr7/0S+Pocz5sBe
	 q9QD2IH5nKNW4lcyu0ldg2evPHmU47LWXWgUui1mOX5Lv08T7Ihij7o/vigHeU3F07
	 r6wKOFo6uI/1w==
Received: from loljews.com (localhost [127.0.0.1])
	by postfix (Postfix) with ESMTP id D3D2D27A360D;
	Sun, 22 Nov 2026 21:05:33 +0200 (EET)
From: Sandeep Haemoon <sandeeph@loljews.com>
To: netdev@vger.kernel.org
Cc: netdev-bot+sinfo@kernel.org, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next v7 0/3] net: ethernet: mtk_eth_soc: 9K jumbo frame support
Date: Sun, 22 Nov 2026 21:05:18 +0200
Message-Id: <patch-ed76e70068ece21c4cb0f5888a818690@loljews.com>
In-Reply-To: <179494547560.3291.4586654587079488988@kernel.org>
References: <patch-7d2c457e68de6b53b7348d1bdbeadcec@loljews.com> <179494547560.3291.4586654587079488988@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

The issue fixed in 1/3 was found by automated review of an earlier
revision of the series, not in production, and has not been triggered at
runtime by us.  It needs MTK_36BIT_DMA, DRAM above 4 GiB, and one of the
early release paths in mtk_poll_rx() (no netdev for the source port,
MTK_RESETTING, or a refill allocation failure) so that a descriptor is
re-armed with the high address bits of the buffer that was mapped for
the previous descriptor.

Hardware: the series was tested on a BPI-R4 Pro 8X (MT7988, 10G port) on
a 6.18.60 backport - 8K ICMP passes and iperf3 with MSS 8900 at MTU 9000
reaches about 9.87 Gbit/s.  The 36-bit fix itself was not exercised
there because the condition was never hit, and the v7.3 series is
compile-tested with CONFIG_NET_MEDIATEK_SOC=y and COMPILE_TEST=y.

