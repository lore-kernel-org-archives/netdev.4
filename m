Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591933;
	b=awj+ffilrDo0iSMMpI24GR/aAsjlp2SwKclokGJ9uCpitrb6shxq/yqtKbhJyj6VNkkI
	 NSayIpqgZs74YT7Plj24y5NX7HFY9SKsVHybbrBVG9ysCrAZ4MdelyH0iz7rpPvcGtHfp
	 nbsOzHM3r13ozE1qbyJNfvZzieIVvXHIoA0fcWHsZvQZLq+UgEflbJwgFFMmvVycYHSkK
	 Qg1h/9LUaJVBKDFwom16l/itVlcq2iuJZKVMZjt4kcyGMCmPn7sTRY9Qn9mJmOoQKREoU
	 nSNRSg399dcSMB4rpdUY2StE23vFk1FJVlzZvw4yxeumnm5AbUbmXqfyCpQvlxt3fGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591933;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=wAz53Alpi3ejryTHRc2NawPv5gXVCpAOBMArNuEAOIY=;
	b=HOwSNexvHMT4RuMvQKWOdoqa+3Didfp13441e0vyPIVdQcOWQaPjnwEAynetUwGnjcqO
	 8PRno4eh5b5W2CDkRoskci9T13RVSCiwmkVTNMm77II6ZJYfcuR5fRvQVG4a4a9yaz43X
	 6meExnYvmdlMP9kwqEf9snjeMOwHi0+0u6yj4Q5FET39cbkOiqAkCyWVwi2wB4Xz3eNMn
	 rH/oXVV7oZngKMiezgfzOr3kxN5Cn2SUvNyFZJGKfXiY2eQoUpzKfIf2cvZQcNj9KWtQ1
	 rVEQjD2wGdkrKOJc6vW2wHOqUhFBovkLjnbS2Z5/Z1ftOdIpxnF5azOmbqJNhMENMAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DD5606A31E;
	Wed, 25 Nov 2026 07:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8DD5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpsz3t1795591875t5e9adc03
X-QQ-Originating-IP: Gworgn1T3BCAM+8OUJ+mrC/VhLhNf5mLaDyfUEJ5ROM=
Received: from localhost ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 15:31:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16730864350289870617
EX-QQ-RecipientCnt: 10
Date: Wed, 25 Nov 2026 15:31:11 +0800
From: Yibo Dong <dong100@mucse.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	yaojun@mucse.com
Subject: Re: [PATCH net-next v3 3/5] net: rnpgbe: Support copper link
 configuration
Message-ID: <40B4940BA65429EC+20261125073111.GB752553@nic-Precision-5820-Tower>
References: <C0071FBC8B693BE4+20261124060602.411328-1-dong100@mucse.com>
 <179558856322.3135.5490844008487521629@kernel.org>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179558856322.3135.5490844008487521629@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: NDcdydrNm/XtJH3jImuVsE8QskkoP3oSqwaPNmRUB2gIyyHms14UvlcL
	29NIG53Cu+aFRuySIthv/TOVzAomYzm2vvQ3Wq0v0MnSumbcczs190lk0IWZZwRjW8F3Um/
	FraekU7voAOuFTINFPTdwCMLFQgn6udV8QKIl1keUcZcgbqOcfISuUUMhrOo+yxoPbd9Gww
	RSncPuu/n0Scev6tV3nA2nJaX37PE8uEtdbk44iF98MRIAh3FuPlkD+sR6J9FwxlXm8uwgB
	iBvBifYnfqfwTW+nRUIaXWWOO+ufV3Y0zSJYXcIo58OXcAu2QMoywFcey6xCYvxnr86bJoY
	mJFZQ49injYl2QzJo2Pu78kX3QqjXOu21dJKHnUDVl+CVPK+FOBKvN/NjAvtdKaPUdPey1n
	If6Urwd7sUBHFltL/wWcWkD/xUDOdfC80UBuxkctSu5KYY5h1SBgqC7w0dR9eV+eG7IBV5U
	k1ratT4eTxzslCYTtw8jjQwzKJoRPGsguMYCz5XRGGCV+2RbH8NBSRIvqXFXPBrclRO8cpL
	CmM8dMYoHCSXk0QExmL7Cyfyk8rpfOcyqGo2fIQGByk7qfbOHHyb4jzG21K2yggEXoz5JQR
	c71KoNimMrwcqLncPGrjfuOaAbavcEXkki1aHo42fSFionKYctyVOcotDcqjmiELApte24L
	bxx9YD0/BsVtPqYhBm1vHO/AlHdLx4Jt7G2AwixSY3g6nAu6f4XuGhFrzpP6cWtGLeEf9SD
	GZzafhIjzB15MoiGMZL7Yb3wFTleMz3AF5DOfY8wHV4xCesg2o4rbIjMOkSBvwkJ92FWCRE
	cIT8rX7ZgSnJh4QjEhoQ/6lJP3Yld2z/bGI5mBwRvo4JghbH3ey/OrJvpETsajyaWNqtwkw
	jkHWYsrXOwGjVImV08L+hDnhuMbNt/GWw+RvQVxDsN2T5+Kw8XRdnQn4LJL1jQmyjBXR2p9
	m44UdP18lmxqi0HPRzWPDk21dsY9e6ZpBe/lvuG+nuPxo1S8MnQB/dwWM52TEDMTV/Qghd9
	zjBDHKVSgZU6R3N4gQezRKv8MewJKbOrJPt/RK398VoT+mIOCh0gYrJGCSfiZx4N9Rym1Mu
	uvRvny8FwMYbjmgydtyd1WFec+oUkit4HbXu9mte2O8d3RKvRo6A8wkg2x4XkhVSoe5YkPu
	I005
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On Wed, Nov 25, 2026 at 06:36:03AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] This patch adds kernel-doc to mucse_mbx_set_link()
>   (drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c, lines 216-218):…
> 
> --
> 
> net: rnpgbe: Support copper link configuration
> 
> This commit adds set_link_ksettings support for copper ports in the
> rnpgbe driver. Copper ports can now configure autonegotiation, advertised
> modes, forced 10/100 Mb/s speed and duplex, and MDI/MDI-X selection.
> Requests to change the media type reported by firmware are rejected, and
> PHY_LINK_SET now uses the event-coalescing mailbox transport.
> 
> > diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
> > index 469818b83d70f..70eef8ed7f5cc 100644
> > --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
> > +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
> > @@ -210,7 +210,12 @@ int mucse_mbx_get_macaddr(struct mucse_hw *hw, int pfvfnum,
> >   * @duplex: forced duplex mode when autonegotiation is disabled
> >   * @mdix_ctrl: MDI/MDI-X control mode
> >   *
> > - * Firmware ignores @speed, @duplex when @autoneg is true.
> > + * Firmware ignores @speed and @duplex when @autoneg is true, and
> > + * @advertising when @autoneg is false.
> > + *
> > + * Firmware acknowledges the request when it consumes it. If the ACK
> > + * wait times out, firmware will not apply the request later, so the
> > + * previous link configuration remains valid.
> 
> [Severity: Medium]
> Does anything on the driver side enforce this guarantee?
> 
> The request is already fully posted to firmware before the ACK wait
> starts. In mucse_write_mbx_pf_coalesce_event():
> 
> 	for (int i = 0; i < size_in_words; i++)
> 		mbx_data_wr32(mbx, MUCSE_MBX_FWPF_SHM + i * 4,
> 			      le32_to_cpu(msg[i]));
> 
> 	hw->mbx.fw_ack = mucse_mbx_get_fwack(mbx);
> 	mucse_mbx_inc_pf_req(hw);
> 	mucse_release_mbx_lock_pf(hw, true);
> 
> mucse_write_mbx_coalesce_event() then calls mucse_poll_for_ack(), which
> gives up after mbx->timeout_us (4 seconds).
> 
> On -ETIMEDOUT, neither mucse_write_mbx_coalesce_event() nor
> mucse_mbx_set_link() clears the SHM payload, rolls back the PF request
> counter or withdraws the request.
> 
> What stops slow firmware from seeing the incremented request counter and
> applying PHY_LINK_SET after the poll has already returned an error?
> 
> The new runtime caller relies on this comment. rnpgbe_set_link_ksettings()
> updates the cached configuration only on success:
> 
> 	err = mucse_mbx_set_link(&mucse->hw, advertising, autoneg,
> 				 autoneg ? 0 : cmd->base.speed,
> 				 autoneg ? 0 : cmd->base.duplex, mdix);
> 	if (!err) {
> 		mucse->hw.mdix_ctrl = mdix;
> 		mucse->hw.link_config.advertising = advertising;
> 		...
> 
> Suppose firmware applies the request late. ethtool -s would have returned
> an error, but the PHY would be running the new autoneg, forced
> speed/duplex or MDI-X setting. rnpgbe_get_link_ksettings() would keep
> reporting the old advertising, speed, duplex, autoneg and
> eth_tp_mdix_ctrl values.
Firmware not 'applies the request late'.
The firmware does not queue mailbox requests for deferred consumption.
When it handles a mailbox notification, it ACKs it after takes the command.
If no ACK arrives within four seconds, firmware has not consumed the
command. It does not subsequently revisit that unhandled notification
and consume the request.
> 
> There is also a related case. The late ACK for the timed-out request
> could arrive after the next PF command has sampled hw->mbx.fw_ack. Could
> mucse_check_for_ack_pf() then count it as the ACK for that new command?
> 
> Before this patch, PHY_LINK_SET was only sent from probe through
> rnpgbe_setup_default_link(), and a failure there aborts probe. With this
> patch it can be sent at runtime while firmware is busy with link events.
That is why now use mucse_write_mbx_pf_coalesce_event for mucse_mbx_set_link.
> 
> The kernel-doc for rnpgbe_init_link_config() already says that firmware
> can be held up completing forced 10 Mb/s link setup. A slow ACK seems
> most likely in that window.
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/6C54E9FB2E95869E%2B20261124060436.410989-1-dong100%40mucse.com
> 
