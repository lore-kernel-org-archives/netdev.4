Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117236;
	b=lKdlt8H5Oi6nwjb0Ijqg7NMDfxSQ0z7kDN1YECvN0hFd3FdgMpTgdaJFnQd2rKS0jP6V
	 Tzk1Sbb226RDlFSW2EnHG71L9w4c6ThDH8KuE4zYlr0kZ4tZIAJhjQQJOno+4tSA+Fijg
	 3t57P7xnXQSvGorcuFheJgE30mbHRTvj3EAHpYaNgEmYhgWCODpkf6Dfr8lR4kGMgNKdV
	 Ap/aMBdQ9iQRE9/S8g+T6pukt3CqaskuQR8/GrB/0LV3Mb4V2oTx7rkR+ov3m0Dso6CNe
	 b8U9UhV2WkqmKsKUv45tbnRGf946RVKS/SpqYtceSQld9tR4IdbVCtkNHNewOWxxedQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117236;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=KllBJ9+aHKHmevvfZXj4eWwtwcZanwxTddFWb4nlWzA=;
	b=IuhQEibYzbPUY0Q4RuLv6Z7rWumX5Boq/YopNSyux7qaXTcv93iWGYRStUc+fCxmm/Nq
	 KUZeWxY0T4XeHQAXJrfDJiVQfsLXCvPqk0k7k2BNxxq8HK3dPG6HYZXFyqligE7iusOPc
	 xgDf+bXuYKyrnhcRlM9Ssy3ntfB3QkRgkUqhF78RvyVdK2vU8crs3iRG8lwc2cUShIg3X
	 jqxVxBWQeXWqOUVqryen/18gWF+6/GKNfrLLB/Hd1eNHcRDaUn+IyJdZuYn1HCNWty9xW
	 b+OB+nztUgy2UqoA6FT+fFyOHJf8YJG53h+1v8bphA8YzRcRksM7VpQmrJa6ySD89+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HlelLrL8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121FA606A337;
	Thu, 19 Nov 2026 19:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HlelLrL8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74781F000C6;
	Thu, 19 Nov 2026 19:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117235;
	bh=KllBJ9+aHKHmevvfZXj4eWwtwcZanwxTddFWb4nlWzA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HlelLrL8Ng2+24StS3Zy59pXifhMcFRrzQWdbgwGFcZ2c4cc/o+TSmXcJh9cWftJx
	 FVpLNcPskOkukVpMzAs/fLn54scLX7G9I/yIYilndZ9iIGE+z62R9C3SYni6ci0D7N
	 ZNFhvxR65Rz+Heqrr/DEcJKd0uEk3Mnn82zSbL1OgpbX76AiQsuDRSAXROU3KZMCcA
	 YPjZABiuphx9bpwVNQ998Z81J/mEoutyOKFMLPt32mDvVkie2Ur9EO0YkVtf+PhyLk
	 kj6IclTiME1nNEpEcJkIjl2ARa/EcWr7CafGojxa6KsOx37GY8/CyIig410KAyqt6q
	 TXeVoW0xZ7iyw==
Subject: Re: [PATCH net v2] net: stmmac: preserve RX checksum capability when
 offload is disabled
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 19:40:34 +0000
Message-ID: <179511723446.3136.5381192433185500992@kernel.org>
In-Reply-To: <20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386@gmail.com>
References: <20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386@gmail.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] After this patch, stmmac_hw_setup()
  (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3725-3729) checks…
- [Low] The struct stmmac_ops comment for rx_ipc
  (drivers/net/ethernet/stmicro/stmmac/hwif.h:322) still says "Enable…

Pre-existing issues:
- [Low] This problem wasn't introduced by this patch, but
  sun8i_dwmac_rx_ipc_enable()…

--

net: stmmac: preserve RX checksum capability when offload is disabled

This patch changes stmmac_hw_setup() so that a zero return from
stmmac_rx_ipc() clears plat->rx_coe only when RX checksum offload was
requested, meaning hw->rx_csum is non-zero. Before this, the RX COE
capability was lost when the interface was reopened after RX checksum
offload had been turned off with ethtool.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 25894771e9e9f..e162976be2e6d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3723,7 +3723,7 @@ static int stmmac_hw_setup(struct net_device *dev)
>  	stmmac_safety_feat_configuration(priv);
>  
>  	ret = stmmac_rx_ipc(priv, priv->hw);
> -	if (!ret) {
> +	if (priv->hw->rx_csum && !ret) {

[Severity: Medium]
Can plat->rx_coe now stay unverified when RX checksum offload is off at
every stmmac_hw_setup() since probe?

For example, if "ethtool -K ethX rx off" runs before the first
"ip link set up", the readback is never checked. plat->rx_coe then keeps
whatever value the HW feature register or platform data reported.

If RX checksum is later enabled while the interface is up,
stmmac_fix_features() keeps NETIF_F_RXCSUM because rx_coe is not
STMMAC_RX_COE_NONE. stmmac_set_features() then ignores the rx_ipc result:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_set_features() {
	if (features & NETIF_F_RXCSUM)
		priv->hw->rx_csum = priv->plat->rx_coe;
	else
		priv->hw->rx_csum = 0;
	/* No check needed because rx_coe has been set before and it will be
	 * fixed in case of issue.
	 */
	stmmac_rx_ipc(priv, priv->hw);
	...
}

That comment assumes the stmmac_hw_setup() check has already run, and
after this patch that is not guaranteed. Before this patch, any open
with a zero readback cleared rx_coe. So once the interface had been
opened, offload could not be enabled at runtime without a check.

Some hardware may advertise RX COE while its IPC bit does not latch. On
such hardware, hw->rx_csum would be non-zero while the MAC is not
validating checksums. stmmac_rx() and stmmac_construct_skb_zc() would
then mark IP frames CHECKSUM_UNNECESSARY based on hw->rx_csum:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_construct_skb_zc() {
	...
	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
		skb_checksum_none_assert(skb);
	else
		skb->ip_summed = CHECKSUM_UNNECESSARY;
	...
}

The zero-copy path does not look at descriptor status at all. Split
header is also enabled from rx_csum > 0.

This would last until the next stmmac_hw_setup() with a non-zero
rx_csum, for example after down/up, resume or an MTU change.

I could not find a specific part where the IPC bit fails to latch, so
this depends on the hardware case that the stmmac_hw_setup() check
exists for.

Would it make sense to check the stmmac_rx_ipc() return in
stmmac_set_features() when offload is enabled? Another option is to
verify the capability once, whatever state was requested.

[Severity: Low]
This isn't a bug, but should the rx_ipc comment in struct stmmac_ops be
updated to match the contract this check now depends on?

drivers/net/ethernet/stmicro/stmmac/hwif.h:
	/* Enable and verify that the IPC module is supported */
	int (*rx_ipc)(struct mac_device_info *hw);

The commit message says the callbacks program the state requested in
hw->rx_csum and return whether IPC is enabled afterwards.
dwmac1000_rx_ipc_enable(), dwmac4_rx_ipc_enable() and dwxgmac2_rx_ipc()
behave that way. The hwif.h comment still reads as if a zero return
means the IPC module is unsupported.

sun8i_dwmac_rx_ipc_enable() already uses the other reading ("caution
this function must return non 0 to work") and ignores hw->rx_csum.

>  		netdev_warn(priv->dev, "RX IPC Checksum Offload disabled\n");
>  		priv->plat->rx_coe = STMMAC_RX_COE_NONE;
>  		priv->hw->rx_csum = 0;

[Severity: Low]
This is a pre-existing issue, not one introduced by this patch, but the
commit message says:

  Keep calling rx_ipc when offload is disabled so that the hardware
  is still programmed with the requested state.

Does that hold for the sun8i EMAC used on H616? The commit message
limits this claim to the GMAC, GMAC4 and XGMAC callbacks.
sun8i_dwmac_rx_ipc_enable() ignores hw->rx_csum and never clears
EMAC_RX_DO_CRC:

drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c:sun8i_dwmac_rx_ipc_enable() {
	...
	v = readl(ioaddr + EMAC_RX_CTL0);
	v |= EMAC_RX_DO_CRC;
	writel(v, ioaddr + EMAC_RX_CTL0);

	return 1;
}

So on sun8i, "ethtool -K ethX rx off" leaves the EMAC checksum engine
on.

stmmac_rx() still treats these frames as CHECKSUM_NONE because coe is
0, so I could not find any frames being marked with the wrong checksum
state. The problem is that the register state does not match the
requested state.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386%40gmail.com
