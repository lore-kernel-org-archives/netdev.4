Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957030;
	b=SuH+5erxXBg8ijsW5spupJ+0Xj6fD7jfNLqvOKrXtqRY2MCElisJ9ESuJZrLZpU8FNwC
	 4aFXcYgr6JW6oAbc/ORRzts2x9n/Ccoliw3fZjybEvLUrS240TkVAHxxP+KYSIqMpzaDJ
	 1N4C9Lcj60UJeFkYrZtu8h+5GDfjo1VYwHVT2qpMmrWnO6q0mfS7J9JFJGCTAuFekdfya
	 2TXdk+M5RTCRFBJRbScJzi97KJ6okmwkqZ/dbZA6CJH5Nt0JFnXenWupfW00eN2OPPgxT
	 zeF5HHRVj+nsinfs5RsmN/ySC9P7gP7q1lKe74QEYFHkI6kQlJfyIVI7m3BbotqWJ6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957030;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+L+eKin3CnXVq27nF9CwbHqF+i1xWp3XpKvpf5rE5cc=;
	b=VD/C+nVVBc3kZjeDG0EnHGrSSMi/9gWQtiGJPlC9ihWQhPlPtBb5kbQLAmNibbEzlTnp
	 NAE+ZWepkBZeUJq/V53Wgyx3NgqYePjDeXaNqqQWGLwC9QESUu8MSP/EXZl6Expb1yyf/
	 7OjLds8REFSUdJl3QY0Ri0qqudQHVTwbwIKu8gNuFgSBr2ni8Sxr4Z/Xefc4oa958ugW/
	 sXMJbClfzxBQ9+BgfVowPhcpv1ur+2NfUl8o92m04l3+BGjNdRrk3/8unryiCpqmf642d
	 D81FJsxUJ/erzgw/bVzuP7DcuFvypJERqchTdlfrfCqhT0gLu+ZDAmrmzANYc+4ZhDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=giTATKpu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80096606A881
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=giTATKpu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78E01F000C5;
	Tue, 17 Nov 2026 23:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794957030;
	bh=+L+eKin3CnXVq27nF9CwbHqF+i1xWp3XpKvpf5rE5cc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=giTATKpuOGSWoRchZLWnCQaTw/bZ2HYwwVjS94b7BrBkopdpHp4O9Nl5txqSnjZnT
	 6YFG5+ekWb22Iut7whCaIlRoM7n8X3M6wNT0V9tMwf4mmyjbY1M95lGjYobyVy+Bia
	 MoGwOVIkr4OEEm9e+iGV01y5a0KUj6SOraUEy8TtZyYuK4Ls5EBY1Vuct0fKGkMAza
	 BgjJIZhCici1E9P+sbQtJWc4uafEFEn42YG0VpodrUf6H+weYzNyoeuvtdY11CB3LU
	 8zX6sdzUrEUJXWzzopgsq8W5dziCjRdlM8nEg8Suy3XLl0p5jCOHZX8AsFdRX+g2mV
	 y4CMA6tqy4CKw==
Subject: Re: [PATCH net-next v4 5/6] ionic: report the operational FEC mode
 from ethtool --show-fec
From: netdev-bot+sashiko@kernel.org
To: eric.joyner@amd.com
Cc: netdev@vger.kernel.org, brett.creeley@amd.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 vadim.fedorenko@linux.dev, nikhil.rao@amd.com, edumazet@kernel.org
Date: Tue, 17 Nov 2026 23:10:29 +0000
Message-ID: <179495702938.3136.7315548716381258707@kernel.org>
In-Reply-To: <20261116-ionic-get-fec-stats-v4-5-d25cae9f1e87@amd.com>
References: <20261116-ionic-get-fec-stats-v4-5-d25cae9f1e87@amd.com>
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

- [Medium] The commit says old firmware "leaves the byte zero", so an
  autoneg link on that firmware reports FEC off.

--

ionic: report the operational FEC mode from ethtool --show-fec

On autoneg links, ionic_get_fecparam() now fills active_fec from
status.fec_type, the operational mode reported by firmware. Without
autoneg it keeps using config.fec_type. The commit message says firmware
that predates status.fec_type leaves that byte zero, so on such firmware
an autoneg link reports FEC off.

> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> index 8f0f1585116bc..ac728b8aa780e 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> @@ -440,6 +440,18 @@ static u32 ionic_fec_type_to_ethtool(u8 fec_type)
>  	}
>  }
>  
> +/* Firmware that predates status.fec_type leaves it zero, which reads as
> + * FEC off.  With autoneg disabled the port runs the configured mode, so
> + * only trust status.fec_type on an autoneg link.
> + */
> +static u8 ionic_active_fec_type(const struct ionic_port_info *port_info)
> +{
> +	if (READ_ONCE(port_info->config.an_enable))
> +		return READ_ONCE(port_info->status.fec_type);

[Severity: Medium]
Is status.fec_type actually guaranteed to be zero on older firmware once
the device has been through a firmware reset?

The commit message says:

    firmware older than that leaves the byte zero, which reads as FEC off.

The driver only zeroes that byte when it first allocates the port_info DMA
buffer. ionic_lif_handle_fw_up() calls ionic_port_init() again. That
function allocates only when idev->port_info is NULL, so after a reset it
reuses the old buffer:

drivers/net/ethernet/pensando/ionic/ionic_main.c:ionic_port_init() {
    ...
	if (!idev->port_info) {
		idev->port_info_sz = ALIGN(sizeof(*idev->port_info), PAGE_SIZE);
		idev->port_info = dma_alloc_coherent(ionic->dev,
    ...
	stat = (__le64 *)&idev->port_info->extra_stats;
	for (i = 0; i < sizeof(idev->port_info->extra_stats) / sizeof(*stat); i++)
		WRITE_ONCE(stat[i], IONIC_STAT_INVALID);
    ...
}

Before PORT_INIT, only extra_stats is reset, to cover fields the firmware
does not know about. Nothing clears status.fec_type. The buffer is freed
only by ionic_port_reset(), which runs from probe and remove.

Say a newer firmware has written IONIC_PORT_FEC_TYPE_RS into
status.fec_type. The device is then reset into firmware older than
c4e7a75a096c, for example by downgrading with devlink flash and
FW_CONTROL ACTIVATE, or by falling back to another image. In that case,
can ionic_get_fecparam() keep reporting the stale RS value as active_fec
on autoneg links until the driver is reloaded? That would hold even if the
link negotiated a different mode or no FEC.

This depends on the old firmware not writing the former reserved byte.
That hasn't been confirmed, but the extra_stats invalidation suggests
firmware writes only the fields it knows about.

Would it make sense to clear status.fec_type, or the whole status block,
in ionic_port_init() before PORT_INIT, the same way extra_stats is
handled?

The later commit "ionic: Add .get_fec_stats ethtool handler" also uses
ionic_active_fec_type(). That path is gated on IONIC_DEV_CAP_EXTRA_STATS,
so old firmware does not reach it, and the rest of the series does not
change this.

> +
> +	return READ_ONCE(port_info->config.fec_type);
> +}
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-ionic-get-fec-stats-v4-0-d25cae9f1e87%40amd.com
