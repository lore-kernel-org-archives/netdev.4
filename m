Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749363;
	b=A/nwcGbg5t/JrAkJs1tIXi9OrsI+UyHXqras6eAoV5u/lTcJzZOmuxe9R8PgQIubik/w
	 b/XkLLWxnx7S/hpx1zcE57BNNBLxhc4ssmlwR5XVO5PXoGsDnVS1FrKOS+6sQYjjozfo2
	 0lT/XsUoVoeJFCBbuOO/BjeW1awdwxAFCPSkCfDPMEuxF/M8hxk9f1VQKZffZMoNISASk
	 f7tiZaoLtM/gXbmMQ2R0ZJBqLu6nYykHMnfXe0H5LoErluedcPwim7YYvmMvNp5i8AK6K
	 yEt/T29BTurS/AAXj6Eszeqp6iJDPViNaWOmYN8Jn+14cv8a8Yws3OQL9IKA6Gc6+sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749363;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=6WjEXdGX+qjILlZxVo6duXdHYPvzCKMM0taT62MYjyw=;
	b=BQDKOcGCsCIDWqG5qnQCMu320fvlcUpzr2D0b0oa5w1yn6BHgC5XZu1CNoKrrNQ8Qbcy
	 PF/NnDoFpzsJ4vj7m2puGIvSDUIaPYNEpKi89knJuH3U6iHmHlW8WDzPhxcE0bpGXPldy
	 saTrCFwMb0dq9W69350UzN87DhwTdFwxbcponoaPuxONHoWPbKaKPC4JGT5uuBuG2hK9u
	 Txslt0GAaG0zPsKBV+FUgE6rcqhlX+oS4q3hykRk0ahO67hWXObXbdUqTGhDW7AI5Nn36
	 JaRB57AEKtkpleEq7YdnfxDoweOUzj1ljOGhdg8TDWFM7Htqiu7GHYJq/MTwVr1xc5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hg96CwIc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BEA606A33C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hg96CwIc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0D81F000C1;
	Fri, 27 Nov 2026 03:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749362;
	bh=6WjEXdGX+qjILlZxVo6duXdHYPvzCKMM0taT62MYjyw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hg96CwIcZKMCeqwHVRepwWhFMMmTTRlKU22L8N38I7aRsjfV/qog6oD2RcD6o3na8
	 Ln3B/Ncd2GnjLAM6TSda93m2IKQ2hRbHgGHx00gJo2XKdCgdoAly8qFmk0LVoo4bHE
	 sIv5XJBiqgL34ss016uQHl8+ko3ovTAOELq/1zIIJPWVGIhyFhsn8zzvfvYvLJP121
	 fBlpi3sGOQDjICM02pKFwAJxwPzp11o5mbUhKd+/yPcBh3Yr+20guI0fAz5HhInGMy
	 PjaRfzZQTtE5HerkBb56FHQjnNZk531fVi5p3QPu+6AvX0ZrCjN+kxQqNPjqw06kKJ
	 Tt048c8IEeQdw==
Subject:
 Re: [PATCH net] net: stmmac: dwmac-socfpga: disable split header on Agilex 5
From: netdev-bot+sashiko@kernel.org
To: jjc@jclark.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rohan.g.thomas@altera.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alex.cramt@gmail.com
Date: Fri, 27 Nov 2026 03:16:01 +0000
Message-ID: <179574936116.3135.3699981290049268393@kernel.org>
In-Reply-To: <20261126031300.211248-1-jjc@jclark.com>
References: <20261126031300.211248-1-jjc@jclark.com>
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

- [Medium] The patch fixes IPv4 fragment corruption with a quirk flag for
  Agilex 5 only, but the root cause it gives does not come from XGMAC…

--

net: stmmac: dwmac-socfpga: disable split header on Agilex 5

This patch sets STMMAC_FLAG_SPH_DISABLE in
socfpga_agilex5_setup_plat_dat(). The aim is to stop IPv4 fragment
corruption that shows up when RX checksum offload, and therefore split
header, is enabled on the Agilex 5 XGMAC core. The commit message
points to commit 47f753c1108e for the Intel platforms, which made the
same change based on the DesignWare Ethernet QoS datasheet.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index 3a89c4da2af57..28ffa5ad12d7a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -578,6 +578,9 @@ static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
>  	/* Enable TSO */
>  	plat_dat->flags |= STMMAC_FLAG_TSO_EN;
>  
> +	/* Disable split header */
> +	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
> +

[Severity: Medium]
Is the root cause specific to Agilex 5, or does it affect all XGMAC
users?

The commit message says:

    Agilex 5 has an XGMAC core, and stmmac turns split header on whenever
    RX checksum offload is on.

The only evidence it cites is the QoS (GMAC4) datasheet, by way of
commit 47f753c1108e. Nothing in the patch shows that the problem is
limited to Agilex 5.

If this is a general XGMAC hardware limitation, other XGMAC platforms
would still have split header enabled. tegra_mgbe_probe() in
dwmac-tegra.c sets core_type to DWMAC_CORE_XGMAC and sets
STMMAC_FLAG_TSO_EN, but it does not set STMMAC_FLAG_SPH_DISABLE. The
generic "snps,dwxgmac" path in stmmac_probe_config_dt() doesn't set it
either. stmmac_dvr_probe() turns split header on for any core that
reports sphen unless the platform opts out:

    if (priv->dma_cap.sphen &&
        !(priv->plat->flags & STMMAC_FLAG_SPH_DISABLE)) {

Would fragmented IPv4 traffic, for example ping -s 2000, still be
corrupted on those platforms?

There is also a possible driver-side cause in the shared XGMAC receive
path. dwxgmac2_get_rx_header_len() reads HL only when L34T is set:

    if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
        *len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;

dwmac4_get_rx_header_len() reads RDES2_HL unconditionally.

Commit 96147375d49f9b added the L34T check. Its message says "Split
Header length is only available when L34T == 0", but the code reads HL
only when L34T != 0.

Suppose the hardware splits a fragmented IPv4 frame but reports L34T
as 0. The header length then stays 0. stmmac_rx_buf1_len() would treat
buf1 as holding the whole frame. stmmac_rx_buf2_len() would return 0
for the last descriptor. The skb could then contain the split header
plus stale buf1 contents, and the payload in buf2 would be lost.

stmmac_rx_buf2_len() also assumes that buf2 is fully filled on
non-last descriptors for every core except GMAC4 with split header
active:

    if ((priv->plat->core_type != DWMAC_CORE_GMAC4 || !priv->sph_active) &&
        (status & rx_not_ls))
        return priv->dma_conf.dma_buf_sz;

The GMAC4 comment just above that check says this assumption does not
always hold when split header is enabled.

If the corruption actually comes from this shared dwxgmac2 header
length handling, would it be better to fix it in the core instead of
adding a per-platform flag? That would also let Agilex 5 keep split
header enabled.

>  	/* Enable TBS */
>  	switch (plat_dat->tx_queues_to_use) {
>  	case 8:

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126031300.211248-1-jjc%40jclark.com
