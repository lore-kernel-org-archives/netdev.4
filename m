Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957028;
	b=JMtvsrzpTAxBI/tJGvx1o5nudSFb/7XC+SqOL+S9jZByVSnlbqCpbB9xgcEk3XCWsVeg
	 iXMMRY+6WDdU0gru689SK3wdQjy/g2I80xblWZcSV7kPHppdm8X4/xo95F96tij3BPz8y
	 NxdTKwFuVNLZ9obF0iOu2zRQR4MeWE7QUtEMpsfjVYFTlbwUJicTbjc/YyxDT9B4hpZKR
	 pmtsTWy2HaHLgZp7j6dPHujRIXhkZ8LIC2WeHt0wTT3KgnBqa6zGWayfVRSk/9IC9zTAQ
	 VGuHjk7y6xY0CZuOtK1paF7K8PSs+3SWJtclMj2u88x7oF0ybz5QRw6S1u14yz89gew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957028;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=p4wAMtyc4NmPtXqxnhc6l2Zk0FAnQB+s8aHnPAKAsfc=;
	b=wNoKksdczTHgg6cRql7Zz56TzycigHNJIx1vMcrFTDiEKTOk9yRPVejlVQx06eU//OPp
	 PIheYTpycfj4+Iyfrh2B4gUzwpyNRmidurxWb52NAtNk47V4PbXtLLjwfQm3MG0Lq/yRG
	 G1NyHOxbRJeuxtvdTZB6Izw7n6IURNfli1JqTBj4sck0/qF+Xrgp4UaknVP7TRYMyJ4AI
	 ZuHodYURtGHSISTfwnTLNNRPIhfcaD5bsZg7kpufiveqvlOMR+vGYCfpbRV2dyieNqR8J
	 8ZhNxtcWFHIxUbNNatORuhePUTbTnD5BJ+TJJJEgll4pfnsDhEU4Ta/5zMtLlPlLPEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BlTY4EUD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A8A606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BlTY4EUD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C461F000C4;
	Tue, 17 Nov 2026 23:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794957027;
	bh=p4wAMtyc4NmPtXqxnhc6l2Zk0FAnQB+s8aHnPAKAsfc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BlTY4EUDJaZrk2aPFLHI77CBDosDLFYL65OFHFR0zeVXDalLnIzmfCDvDTF7Jgoao
	 /p5KW1CGiEdRJh8GnBlbSM6cF5MfursdQZB1v80T5GQZiVTC2FYIkCIhJ1QSsCVx8i
	 W9n9Wprtxoid6xHPesTU+3eq9ZPMTKN8IOOlO5KH6ykEmDcSBMgaxYs3mtd7Weh6+O
	 1F+NPPHh+W9esyR4/nxsSiB5W+KAO3cudfIiMkaBDQGSFLFp6zAkP5bm7oYBfBJRbF
	 Nkn09t8DxGSgT3vXD2+P/99oaZiqaQAWki4K1H7mYjH9TTS0vDzT81Jh71dBmhiBAl
	 iXSQiJV8bnD3A==
Subject:
 Re: [PATCH net-next v4 2/6] ionic: report FEC off as a supported link mode
From: netdev-bot+sashiko@kernel.org
To: eric.joyner@amd.com
Cc: netdev@vger.kernel.org, brett.creeley@amd.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 vadim.fedorenko@linux.dev, nikhil.rao@amd.com, edumazet@kernel.org
Date: Tue, 17 Nov 2026 23:10:26 +0000
Message-ID: <179495702693.3136.14857089621112634448@kernel.org>
In-Reply-To: <20261116-ionic-get-fec-stats-v4-2-d25cae9f1e87@amd.com>
References: <20261116-ionic-get-fec-stats-v4-2-d25cae9f1e87@amd.com>
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

- [Medium] ionic_get_link_ksettings()
  (drivers/net/ethernet/pensando/ionic/ionic_ethtool.c) now sets…

--

ionic: report FEC off as a supported link mode

This patch adds FEC_NONE to the supported link modes that
ionic_get_link_ksettings() reports. It also adds FEC_NONE to the
advertised modes when the port is configured with FEC off. According to
the commit message, firmware does not report per-port FEC capabilities,
so every mode any ionic device can use is listed, and firmware rejects
the ones a given port cannot run.

> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> index 119ac720c0787..84378bef9fb8b 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> @@ -298,9 +298,16 @@ static int ionic_get_link_ksettings(struct net_device *netdev,
>  
>  	linkmode_copy(ks->link_modes.advertising, ks->link_modes.supported);
>  
> +	/* Firmware does not report which FEC modes a port supports, so list
> +	 * every mode an ionic device can use; firmware rejects a request for
> +	 * a mode the port cannot run.
> +	 */
> +	ethtool_link_ksettings_add_link_mode(ks, supported, FEC_NONE);

[Severity: Medium]
Is the claim in this comment accurate? The firmware ABI in ionic_if.h
seems to define a per-port list of supported FEC types:

drivers/net/ethernet/pensando/ionic/ionic_if.h:
 * @fec_type:       supported fec types
 ...
union ionic_port_identity {
	struct {
		...
		u8     fec_type[4];
		u8     pause_type[2];
		u8     loopback_mode[2];
		__le32 speeds[16];
		...

ionic_port_identify() in ionic_main.c already copies this structure into
ionic->ident.port with memcpy_fromio(). However, nothing in the driver
reads ident.port.fec_type[].

The commit message says AINIC firmware rejects FEC off. With this change,
ethtool on an AINIC port will show "None" as a supported FEC mode. A
request for FEC off then reaches firmware through ionic_set_fecparam():

	if (fec_type != lif->ionic->idev.port_info->config.fec_type) {
		mutex_lock(&lif->ionic->dev_cmd_lock);
		ionic_dev_cmd_port_fec(&lif->ionic->idev, fec_type);
		ret = ionic_dev_cmd_wait(lif->ionic, DEVCMD_TIMEOUT);

and the firmware error comes back to userspace.

If firmware fills identity.fec_type[], could the supported FEC set be
built from it instead of extending the hardcoded list?

If firmware does not fill it, should the comment say that the field
exists but is not populated? As written, the comment contradicts the
documented ABI.

There is also another way to tell the parts apart. The driver already
reads dev_info.asic_type in ionic_init_devinfo(), and
ionic_doorbell_wa() uses it for per-ASIC behaviour. Could asic_type be
used to leave FEC_NONE out on parts whose firmware rejects FEC off?

The later patches in this series do not appear to change this. At the
end of the series, FEC_NONE is still added to supported unconditionally,
and ident.port.fec_type[] is still never read.

>  	ethtool_link_ksettings_add_link_mode(ks, supported, FEC_BASER);
>  	ethtool_link_ksettings_add_link_mode(ks, supported, FEC_RS);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-ionic-get-fec-stats-v4-0-d25cae9f1e87%40amd.com
