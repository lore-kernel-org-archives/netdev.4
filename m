Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588564;
	b=Gm1A7w8BKOSLIxqw3rtfd4HOTsWJsHwdZwVKpmqVXWtjk+WNSlJltYLHmx7IY7YSVykH
	 5vubg1PXe8lLnhRe6AByk4k+xeVvKWqwIotCoSk1NwbEDHPz5N5A6KFQ4UI5vJrK1kVzk
	 vVEm7aXNO/Hh0zyFi95vWFiTWf6i4kcVTbM2pBfhYmqzkh4mHOBBbACRhAV9SVsFSDla/
	 o25lHnt+GviLzeSpuH0rk8P8KsGMxPCDovJ+PxuyafsuQ42BXkejn+PHbGuf/ALg/fCaZ
	 A/M+zg9Gcm9UrDTnZWFIEpkOvLF8tToO/L8ikJN9K3NgQnT7XO8j3korUBJwTnJ3QUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588564;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=h+yinOnLq8feQloAbogI5ELmBrxeFoOULL2TXqfdUxY=;
	b=RvIAGnmZGRcvgP/66ym+MnvyGrYtIbP1h8gRBvn79qLJSpcgDpRdNJPiNGk9hZKRtQyE
	 XccqNPNmyqXekDr5iFy9CjWlwTejDgI5pP/vdyOUd0rykSUqy+k/FGXS3lvteVr6Mc3NU
	 JXu0TkPDWld5ULUaZFzggE0Vww050Y/SDGO+wy5rBLYr/ZfnaEkoLVP/7UOxcXlTGQGh1
	 9AgHO/vOEYiT8O5+q78x11BwBxh2cxdRdxRLNBypeLRHWcdHVtmsm4Hg544qO9X4/ElaU
	 a386uDGyqbju97AUVkn9joIpDp/njEE6Ws3219c1cqun4d0J9feMliksQk1XizIcMow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FQmZ93K+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6663C606A334;
	Wed, 25 Nov 2026 06:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FQmZ93K+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57FD1F000C0;
	Wed, 25 Nov 2026 06:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795588564;
	bh=h+yinOnLq8feQloAbogI5ELmBrxeFoOULL2TXqfdUxY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FQmZ93K+cnngjF88Ofo7ph6wZRym9S13Tpy+ZHvfBaWW76bt7dva8oD5/PMFbNlGI
	 IPplGYqbkCRk30IxbEBi25D57sXAWHoWa5X7VAGazvyQzprFcEukCC6rCm8+Y0Kr6M
	 u5Vvuob5oghOHp/ugxx3A2ehX4M8JNXx7cBZclUcznyHNfRXxjNRXLsSVXSMTWkSov
	 Tc8prt0tuRtl5MUf1HAh107X46lAHOsvrO3F76291uiTgxYxFXNqcS4pOZ/0u4UeQc
	 8qBViuiYH761XTlEWCOgFyN6wt2IFVZrZZSjhWdd3kSQKNa3GaBe4mA67BF3A1WKLH
	 7MpW9XoJcUspA==
Subject:
 Re: [PATCH net-next v3 3/5] net: rnpgbe: Support copper link configuration
From: netdev-bot+sashiko@kernel.org
To: dong100@mucse.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, yaojun@mucse.com
Date: Wed, 25 Nov 2026 06:36:03 +0000
Message-ID: <179558856322.3135.5490844008487521629@kernel.org>
In-Reply-To: <C0071FBC8B693BE4+20261124060602.411328-1-dong100@mucse.com>
References: <C0071FBC8B693BE4+20261124060602.411328-1-dong100@mucse.com>
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

- [Medium] This patch adds kernel-doc to mucse_mbx_set_link()
  (drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c, lines 216-218):…

--

net: rnpgbe: Support copper link configuration

This commit adds set_link_ksettings support for copper ports in the
rnpgbe driver. Copper ports can now configure autonegotiation, advertised
modes, forced 10/100 Mb/s speed and duplex, and MDI/MDI-X selection.
Requests to change the media type reported by firmware are rejected, and
PHY_LINK_SET now uses the event-coalescing mailbox transport.

> diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
> index 469818b83d70f..70eef8ed7f5cc 100644
> --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
> +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
> @@ -210,7 +210,12 @@ int mucse_mbx_get_macaddr(struct mucse_hw *hw, int pfvfnum,
>   * @duplex: forced duplex mode when autonegotiation is disabled
>   * @mdix_ctrl: MDI/MDI-X control mode
>   *
> - * Firmware ignores @speed, @duplex when @autoneg is true.
> + * Firmware ignores @speed and @duplex when @autoneg is true, and
> + * @advertising when @autoneg is false.
> + *
> + * Firmware acknowledges the request when it consumes it. If the ACK
> + * wait times out, firmware will not apply the request later, so the
> + * previous link configuration remains valid.

[Severity: Medium]
Does anything on the driver side enforce this guarantee?

The request is already fully posted to firmware before the ACK wait
starts. In mucse_write_mbx_pf_coalesce_event():

	for (int i = 0; i < size_in_words; i++)
		mbx_data_wr32(mbx, MUCSE_MBX_FWPF_SHM + i * 4,
			      le32_to_cpu(msg[i]));

	hw->mbx.fw_ack = mucse_mbx_get_fwack(mbx);
	mucse_mbx_inc_pf_req(hw);
	mucse_release_mbx_lock_pf(hw, true);

mucse_write_mbx_coalesce_event() then calls mucse_poll_for_ack(), which
gives up after mbx->timeout_us (4 seconds).

On -ETIMEDOUT, neither mucse_write_mbx_coalesce_event() nor
mucse_mbx_set_link() clears the SHM payload, rolls back the PF request
counter or withdraws the request.

What stops slow firmware from seeing the incremented request counter and
applying PHY_LINK_SET after the poll has already returned an error?

The new runtime caller relies on this comment. rnpgbe_set_link_ksettings()
updates the cached configuration only on success:

	err = mucse_mbx_set_link(&mucse->hw, advertising, autoneg,
				 autoneg ? 0 : cmd->base.speed,
				 autoneg ? 0 : cmd->base.duplex, mdix);
	if (!err) {
		mucse->hw.mdix_ctrl = mdix;
		mucse->hw.link_config.advertising = advertising;
		...

Suppose firmware applies the request late. ethtool -s would have returned
an error, but the PHY would be running the new autoneg, forced
speed/duplex or MDI-X setting. rnpgbe_get_link_ksettings() would keep
reporting the old advertising, speed, duplex, autoneg and
eth_tp_mdix_ctrl values.

There is also a related case. The late ACK for the timed-out request
could arrive after the next PF command has sampled hw->mbx.fw_ack. Could
mucse_check_for_ack_pf() then count it as the ACK for that new command?

Before this patch, PHY_LINK_SET was only sent from probe through
rnpgbe_setup_default_link(), and a failure there aborts probe. With this
patch it can be sent at runtime while firmware is busy with link events.

The kernel-doc for rnpgbe_init_link_config() already says that firmware
can be held up completing forced 10 Mb/s link setup. A slow ACK seems
most likely in that window.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/6C54E9FB2E95869E%2B20261124060436.410989-1-dong100%40mucse.com
