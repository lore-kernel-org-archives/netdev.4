Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795735484;
	b=W2vvVXjiBc8RBANB5/m5l+/Yy37xdycwI7MM0qWfTgpsRWmOHP6Cfx2juTcADYoO6T52
	 oOR2LV16GbngZ2wslKKXp+lHijKL7hSzbCjJpMf2frPhZtVO6QHxSjEPxh8dXF6rAE/KR
	 of0MtT1XW4lmNO1ZvzeADmQWvwn59ihMyviaoWiMmQndqYpaHtbuF5PRdDu2v98m5RR1m
	 eXjbosX9SQfz3ayDvYRwPMO29ZbWJoMgTNU46SRbA3TwJKBbjWOORXdRm69lFAfff5sfi
	 CQxe7oznRCzTybvTgidRH0UnW734jwAJ9yuvUy54RLIV083gxAe7g3T0n84FrWXvYzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795735484;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=W6ONkCMnQ3s+chRJOqhep3MyunxLm38VvQTxz+Ys3C0=;
	b=ymhttRxhfMtVcPyBF1x3/7dmFECFQH6DId4BenjGe56PL6bbWDP7IwRtAtd8asxQlB+F
	 95j2OT5B2+pGujQ1bygEcGr8zrpq9KHV7vgRnjPdHh0h7Vz4z5i7qD2dAWGo+mGGOAeTK
	 lW+MFHn8QI1Gz4GfmnqmIjr4ywPAxDNy5W+QHED/4K2CbhQEhTlzKTB4nGxS1NHsb0W+5
	 LMBc/uzQ10Bux7JFwV9DAcZs8gEQ+jNMyOo3fA28GtOJG0sS5hdkydj+epGlZ7cjtJCjC
	 OdLyGGQvO4+Lmb05BZoZT6KWnRZfyIWTF0tBGVBneApqsgSrJwPkMtOH68rewC9OaVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EPqG8l1y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564CE606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 23:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EPqG8l1y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687441F00893;
	Thu, 26 Nov 2026 23:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795735484;
	bh=W6ONkCMnQ3s+chRJOqhep3MyunxLm38VvQTxz+Ys3C0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EPqG8l1ypLOcyxYX+aD//i0Aj7msb4IZdNuNR7XNEqeds/0ksgC7Y7qqni+lx5q59
	 PxAJmeMuWv37Ox14kDirqvN3WhzWW9uBlQDcIa1VZyuZoi6PWCTdqunmayZECo0GkR
	 7oXKyUZAsXu3ouC/lAUPjImZtAYEtVDVK1zSINtXWdDqbjxSlDHxi55MOx1CvOeFOz
	 XXnHViGXEFrdGZ5IPxhzZWqVrPyvVR9VJUPkclfr/8BJoZi5ad21k/mL4UBX0g1ZuU
	 JyhuQRlzr6XJ2lAw4R7xkw7WESigA1D9Gi4Glub1HOQQIuKT7K20pybRiCRVYMwe4N
	 fs0fcfrzDFxlA==
Subject: Re: [PATCH net-next v6 1/6] ionic: access the extra_stats counters
 one at a time
From: netdev-bot+sashiko@kernel.org
To: brett.creeley@amd.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, sln@onemain.com, netdev@vger.kernel.org,
 horms@kernel.org, vadim.fedorenko@linux.dev, nikhil.rao@amd.com,
 eric.joyner@amd.com, leitao@debian.org, ArunKumar.Prakash@amd.com
Date: Thu, 26 Nov 2026 23:24:42 +0000
Message-ID: <179573548295.3135.15579756299984220359@kernel.org>
In-Reply-To: <20261125-ionic-get-fec-stats-v6-1-1ab49c729c00@amd.com>
References: <20261125-ionic-get-fec-stats-v6-1-1ab49c729c00@amd.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Commit "ionic: access the extra_stats counters one at a time"
  fixes a user-visible defect but has no Fixes: tag.

--

ionic: access the extra_stats counters one at a time

This commit stops ionic_port_init() from writing the IONIC_STAT_INVALID
markers into port_info->extra_stats with a memset() of the whole block.
It also stops ionic_extra_port_stats_get_count() from taking its snapshot
with a struct copy. Both now walk the block as an array of __le64, using
WRITE_ONCE() and READ_ONCE() on one counter at a time, so ethtool -S
cannot report a torn counter.

> Both run without a common lock: ionic_port_init() is called from the
> firmware recovery work, and an ethtool -S that got past the device
> present check before the netdev was detached can still be running.
> Neither memset() nor a struct copy guarantees the width of its
> accesses, so the snapshot can hold a counter that is neither its old
> value nor the marker, and ethtool -S then reports it.  The
> .get_fec_stats handler added later in this series has the same need.
>
> [ ... ]
>
>     Signed-off-by: Nikhil P. Rao <nikhil.rao@amd.com>
>     Signed-off-by: Eric Joyner <eric.joyner@amd.com>
>     Signed-off-by: Brett Creeley <brett.creeley@amd.com>

[Severity: Low]
The commit message describes a bug that users can see: ethtool -S can
report a torn counter. Should this patch carry a Fixes: tag?

The two constructs it replaces both come from the same commit. One is the
memset(&idev->port_info->extra_stats, 0xff, ...) in ionic_port_init(). The
other is the struct copy in ionic_extra_port_stats_get_count():

    *pes_cache = idev->port_info->extra_stats;

That commit has already been applied to the net tree:

    Fixes: cb683ff6ee07 ("ionic: Report "rx_bits_phy" stat to ethtool")

Other fixes in this series carry Fixes: tags. Examples are "ionic: report
FEC off as a supported link mode", "ionic: report the configured FEC mode
in ethtool_fecparam.fec" and "ionic: report the operational FEC mode from
ethtool --show-fec". That makes the missing tag here look unintentional.

Without the tag, stable and backport tooling will not pick this up for
kernels that contain cb683ff6ee07. If the torn read is not considered
worth backporting, could the commit message say so?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125-ionic-get-fec-stats-v6-0-1ab49c729c00%40amd.com
