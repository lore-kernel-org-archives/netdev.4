Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795735485;
	b=UUXX1C9s6CGOQE4VHkbBeK6r4/Kl+0e4Wmmt/PVFHTZcH2trOeyHdYm4Tbtm8JPnfd9T
	 bzetjuJ8Y/Uid8e7/7RmijIG05UszIo1SgstD8Btde6WIaXMgsDqw+6x+zoZ+drnAX90A
	 DdAuE8Qk8fWUla+uoYNdo9NQESerEGUtgGQ272ZUr7VTbsMOO2mXE4zMfomGHTOl/sG6a
	 437Lg71XmxuwqIlcwFiEFGeo0k7nfny/fnv5xkpJoVJ5jmfY+2kC6/xFmRk8jT9vNesa5
	 ioFkIJvphfORLwL1j3RJfL6q5egJ15EysugEnCGKQNC5MottImt7IjntxJJ8zCt4djg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795735485;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=eEGYTkLuhc4+m4ZcewXGcvSzNDfoHOOPlqXnrOyTzeY=;
	b=a6eJS73FtuMQMk1kGNAZUlPuyVC0w74GiaYoxb88NMZqTfAgeFnNjwWdhXNGO1fJ7te1
	 oONSMhwNxynFbfwJ/URxX2/QzOruXK4km+gavXCSD9I0lzjSsVSK6pwWpN1FDoS/bpOTD
	 LFjo9yWRIpKmKci1dU0yG+TxUgOtrQqyuwwy45kkvQB0PnQRMJgJtyaxNU5/BuqIZTTO0
	 LokqSE54eWJqPwO5Dsn+uyS5Ek6EScKDluKsq7IokLlwMB5S0VwyGpWalaSkeARltaJyG
	 kqafy5tRUsZE7NiYuEGnWAYllDIQB56S5oi00E4QVEF7Cgbcnhyu933iNkglXYCRRLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g3PHlLMh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D158E606A330
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 23:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g3PHlLMh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A1B1F00896;
	Thu, 26 Nov 2026 23:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795735485;
	bh=eEGYTkLuhc4+m4ZcewXGcvSzNDfoHOOPlqXnrOyTzeY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=g3PHlLMhMDbu7aJ6CSTjK3cozrhmehZGH7kXVhEukUMBvex5rab0U/cZBwtBN4AFw
	 7HlVyN0MMs3OrzSlWCsqm4MV8zQnIV9bljKAkL8Ji3XtgsepNTSVyVqsBn8cEUC/Ex
	 30tAM/n9+mWvtLvsHMeUZE50/B1TcfOSmk2Z8PqDPOe63gq1wvmL6fHFFL+7Ef9Ize
	 W2YLK3SxAZ9lJF9RveORsOR6N9JnOIopHetfOqQiwEyueoP3NEDwUCFCHl2UcyGLUj
	 JlTz8ugz+Yk/DmcnKj6TWDK7DHSXNtmxhlw9yrnSDWc3oP10Hi8BzQ0QlulrSXZ1Mc
	 XVwP/l9WYQeaw==
Subject: Re: [PATCH net-next v6 3/6] ionic: report the configured FEC mode in
 ethtool_fecparam.fec
From: netdev-bot+sashiko@kernel.org
To: brett.creeley@amd.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, sln@onemain.com, netdev@vger.kernel.org,
 horms@kernel.org, vadim.fedorenko@linux.dev, nikhil.rao@amd.com,
 eric.joyner@amd.com, leitao@debian.org, ArunKumar.Prakash@amd.com
Date: Thu, 26 Nov 2026 23:24:44 +0000
Message-ID: <179573548438.3135.12554044368884679854@kernel.org>
In-Reply-To: <20261125-ionic-get-fec-stats-v6-3-1ab49c729c00@amd.com>
References: <20261125-ionic-get-fec-stats-v6-3-1ab49c729c00@amd.com>
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

- [Medium] When port autoneg is on, ionic_get_fecparam() reports a stale
  manual setting as the port's configured FEC.

--

ionic: report the configured FEC mode in ethtool_fecparam.fec

ionic_get_fecparam() used to set fec->fec to the constant
ETHTOOL_FEC_OFF | ETHTOOL_FEC_RS | ETHTOOL_FEC_BASER. With this patch it
sets fec->fec from port_info->config.fec_type, so only the configured FEC
mode is reported. fec->active_fec is still derived from config.fec_type.

> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> index 16c6e4c9852e9..e7262a842eda4 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> @@ -432,17 +432,18 @@ static int ionic_get_fecparam(struct net_device *netdev,
>  	switch (lif->ionic->idev.port_info->config.fec_type) {
>  	case IONIC_PORT_FEC_TYPE_NONE:
>  		fec->active_fec = ETHTOOL_FEC_OFF;
> +		fec->fec = ETHTOOL_FEC_OFF;
>  		break;
>  	case IONIC_PORT_FEC_TYPE_RS:
>  		fec->active_fec = ETHTOOL_FEC_RS;
> +		fec->fec = ETHTOOL_FEC_RS;
>  		break;
>  	case IONIC_PORT_FEC_TYPE_FC:
>  		fec->active_fec = ETHTOOL_FEC_BASER;
> +		fec->fec = ETHTOOL_FEC_BASER;
>  		break;
>  	}

[Severity: Medium]
Can this report an old manual setting as the configured FEC when
autoneg is enabled on the port?

fec->fec now comes only from config.fec_type, and config.an_enable is
never checked. With autoneg on, ETHTOOL_GFECPARAM and
ETHTOOL_MSG_FEC_GET would show one fixed mode (for example "Configured
FEC encodings: RS"). That mode is whatever was last set by hand.
ETHTOOL_FEC_AUTO is never reported.

The uAPI kernel-doc for struct ethtool_fecparam says:

 * FEC settings are configured by link autonegotiation whenever it's enabled.

ionic_set_fecparam() also rejects FEC changes while autoneg is on:

	if (lif->ionic->idev.port_info->config.an_enable) {
		netdev_err(netdev, "FEC request not allowed while autoneg is enabled\n");
		return -EINVAL;
	}

Both suggest config.fec_type is not the policy in effect under autoneg.
The later patch in this series, "ionic: report the operational FEC mode
from ethtool --show-fec", describes config.fec_type on an autoneg link
as whatever was last programmed while the link negotiates something
else.

The problem still exists at the end of the series. There, active_fec
uses status.fec_type under autoneg through ionic_active_fec_type(), but
fec still has no autoneg check:

	fec->active_fec = ionic_fec_type_to_ethtool(active_fec_type);
	fec->fec = ionic_fec_type_to_ethtool(config_fec_type);

ionic_get_link_ksettings() does put config.fec_type into the advertised
FEC link modes. If firmware uses config.fec_type as the FEC request
during autoneg, reporting it here may be intended.

If it does not, should fec->fec report ETHTOOL_FEC_AUTO when
config.an_enable is set?

>  
> -	fec->fec = ETHTOOL_FEC_OFF | ETHTOOL_FEC_RS | ETHTOOL_FEC_BASER;
> -
>  	return 0;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125-ionic-get-fec-stats-v6-0-1ab49c729c00%40amd.com
