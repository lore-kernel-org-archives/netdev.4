Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795243154;
	b=m67Xqa2OaHsqVsPvEDzviYYC3um5i/TMS/DaKZN6nItOHVT0aIm/gCfJm8I7OCDd/+mK
	 euwpSRlEowo6WQsBbxGQxF8tafa6D+dp7b3fdgjZzU5Tzet0Hdxyd4qxrjisRVV1z1NWl
	 kkx7v8dvPrSI0txguHvGm4QmynrQ7++npxad7lwDSTSD7W1FZhLvYYdCHpq5xk1wpYXuI
	 L6KTF/0VFENF3NblEidoJ1mvZRrH6bQ5msyw0wP7lU1UBBwRdx95atgJgVyOamfljvND3
	 7utuHcfnyLnJSJavFQP6qXRP5M444mwulLGkrvndkPe8tHxuf5Lfj2kzUvqODdrNrXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795243154;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=54brZSoPxAlmjmzOlCWzPGvO03eSsmlJ6SGiLYccAYY=;
	b=4Gz2OB85s0UGBQzL0aMxdQUO7iE8y7HW4xxxdw3gDkcfFLu/QDwlW9d3s1wSmJRuMr3f
	 QFRD7dF+uJwlbMcEZjP8Vt5fSC2PShZH/LI9JsH8OdbMOGNL9EL9pjblBKwPgf1vDSa0s
	 lh0OIvDBdW2NppF1MfD2MkJlZ25LXuJ3kY6Ao0LpdQLUxls+WPosxpMUIaycATNtqq2WJ
	 OJzqJo0oLPFVpALKxzvMhd//myxe+cMiuEcErXiE8hzp1FyTVnLf58QvljdBWxnBjG3sW
	 un9ZoIXQ5r6BQcx//YyTZ+SKQ196VdOJ5cOJGoxBbkufccmSrD1CUo6axuFguVjilrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cV7Gxrgm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4469C606A69B;
	Sat, 21 Nov 2026 06:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cV7Gxrgm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9681F000CA;
	Sat, 21 Nov 2026 06:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795243154;
	bh=54brZSoPxAlmjmzOlCWzPGvO03eSsmlJ6SGiLYccAYY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cV7GxrgmvRrc3A+2pJ/TAlCq+kZ3cCugEmUE0P2p/b0rXeGjVZYSfLDg3sliV4Z/B
	 Uwf6WAMUncI89gKQZB0+D+vx792sPi05XBvmrDiPJqAJMW+Kzu+qDSoCazRb87+adJ
	 4BjpBidkImSO3+gGPXGxhBsVui9yK91d1efOpxcml483CmsSE0bZQx8Fv2yZbrg+PK
	 bof0iXRzFqEGlsNsERhZRuZgWWBDbnA/gJX+ZQXQwzbspyhDKxUYNSXtHGvlTIrRec
	 kMg+o7fbriTSS5mtXYcUl+gAopZA8hOQk3fCSpADDRxcTVH0dC7tnVFeZ1PxwlvEab
	 P13D4bnD9tn7w==
Subject: Re: [PATCH net-next v3 3/3] net: phy: realtek: add hardware
 timestamping for RTL8127a
From: netdev-bot+sashiko@kernel.org
To: javen_xu@realsil.com.cn
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 nb@tipi-net.de, maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, daniel@makrotopia.org, vladimir.oltean@nxp.com
Date: Sat, 21 Nov 2026 06:39:12 +0000
Message-ID: <179524315282.3135.3731897170058484740@kernel.org>
In-Reply-To: <20261117060120.1175-4-javen_xu@realsil.com.cn>
References: <20261117060120.1175-4-javen_xu@realsil.com.cn>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 8 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 7 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] rtl8127a_ptp_remove() (realtek_ptp.c:764-782) does not quiesce
  rxtstamp() or txtstamp() callers that are already running before it…
- [Medium] RX hardware timestamps can be silently wrong.
- [Medium] rtl8127a_ptp_hwtstamp_set() leaves the cached state
  inconsistent when turning timestamping off fails.
- [Medium] The TX path decides that the tracked skb's timestamp is ready
  using status bits that frames it does not track can also set.
- [Medium] ptp->hw_enabled is a check-then-act value with no lock shared
  between its writer and its reader.
- [Medium] Senders other than the PTP daemon can control or corrupt this
  driver's hardware timestamps.
- [Medium] rtl8127a_ptp_hwtstamp_enable() always finishes by setting bit
  15 of VEND2 0xa640 (RTL8127A_PHY_RST) with a read-modify-write (lines…
- [Medium] rtl8127a_ptp_trx_ts_cmd() (lines 233-248) uses
  rtl8127a_ptp_modify() on RTL8127A_PTP_TRX_TS_STA with a mask of only…

--

net: phy: realtek: add hardware timestamping for RTL8127a

This commit registers a mii_timestamper for the RTL8127A internal PHY, so
the PHY can provide hardware timestamps for PTPv2 event messages over UDP
without MAC driver support. Timestamps are read over MDIO from the PTP aux
worker. RX skbs are queued until their timestamp has been read, and a
single pending TX skb is completed once the hardware reports its
timestamp.

> diff --git a/drivers/net/phy/realtek/realtek_ptp.c b/drivers/net/phy/realtek/realtek_ptp.c
> index 9622571249f45..6caa7d1125840 100644
> --- a/drivers/net/phy/realtek/realtek_ptp.c
> +++ b/drivers/net/phy/realtek/realtek_ptp.c

[ ... ]

> @@ -189,6 +227,53 @@ static int rtl8127a_ptp_write_time(struct rtl8127a_ptp *ptp,
>  	return 0;
>  }
>  
> +/* Latch the RX or TX timestamp of the given message type into the
> + * RTL8127A_PTP_TRX_TS_TIME registers.
> + */
> +static int rtl8127a_ptp_trx_ts_cmd(struct rtl8127a_ptp *ptp, u16 cmd)
> +{
> +	int ret;
> +
> +	ret = rtl8127a_ptp_modify(ptp, RTL8127A_PTP_TRX_TS_STA,
> +				  RTL8127A_PTP_TRX_TS_SEL_RX |
> +				  RTL8127A_PTP_TRX_TS_MSGTYPE,
> +				  RTL8127A_PTP_TRX_TS_RD | cmd);

[Severity: Medium]
rtl8127a_ptp_modify() reads TRX_TS_STA and writes back every bit outside
SEL_RX | MSGTYPE. That includes the TX_PDLYRSP_RDY, TX_PDLYREQ_RDY,
TX_DLYREQ_RDY and TX_SYNC_RDY status bits (15:12).

INSR in the same block is write-1-to-clear. If these RDY bits work the
same way, wouldn't every latch command clear the ready flags of any
pending TX timestamp?

rtl8127a_ptp_do_aux_work() drains rx_queue before it services the TX skb:

    while ((skb = skb_dequeue(&ptp->rx_queue)))
        rtl8127a_ptp_rx_tstamp(ptp, skb);

    if (rtl8127a_ptp_tx_tstamp(ptp))

So a master that sends Sync while receiving Delay_Req could lose SYNC_RDY
to the RX latch. rtl8127a_ptp_egress_time() would then time out in its
1 ms poll and drop the TX skb.

The tree does not document how the RDY bits behave, so this depends on
the hardware.

> +	if (ret)
> +		return ret;

[ ... ]

> @@ -323,6 +408,107 @@ static int rtl8127a_ptp_settime64(struct ptp_clock_info *info,

[ ... ]

> +/* Returns true if no TX timestamp is pending anymore */
> +static bool rtl8127a_ptp_tx_tstamp(struct rtl8127a_ptp *ptp)
> +{
> +	struct skb_shared_hwtstamps hwts = {};
> +	struct timespec64 ts;
> +	int ret;
> +
> +	/* Pairs with smp_store_release() in rtl8127a_ptp_txtstamp() */
> +	if (!smp_load_acquire(&ptp->tx_skb))
> +		return true;

[ ... ]

> +	ret = rtl8127a_ptp_read(ptp, RTL8127A_PTP_INSR);
> +	if (ret < 0 || !(ret & RTL8127A_PTP_INT_TX_TS)) {
> +		mutex_unlock(&ptp->lock);
> +		return false;
> +	}
> +
> +	ret = rtl8127a_ptp_write(ptp, RTL8127A_PTP_INSR,
> +				 RTL8127A_PTP_INT_TX_TS);
> +	if (!ret)
> +		ret = rtl8127a_ptp_egress_time(ptp, ptp->tx_msgtype, &ts);

[Severity: Medium]
Could INSR TX_TS and the per-type RDY bit be left over from a frame the
driver never tracked?

The commit message says the PHY timestamps every PTPv2 UDP event message
on TX. So these bits are also set by frames that rtl8127a_ptp_txtstamp()
drops:

- frames without SKBTX_HW_TSTAMP (any socket sending to UDP port 319)
- frames sent with HWTSTAMP_TX_OFF while the hardware is on for RX
- frames sent while RTL8127A_PTP_TX_IN_PROGRESS is held
- a late frame that goes out after the 15 second timeout path has
  cleared INSR

When no tx_skb is pending, the early return above leaves that status in
place, so it is still set when the next skb is armed. The TRX_TS_STA RDY
bits are never cleared explicitly.

rtl8127a_ptp_txtstamp() schedules the worker with delay 0, which is
normally before the new frame is on the wire. If the stale frame was of
the same type, the RDY poll in rtl8127a_ptp_egress_time() succeeds right
away. Wouldn't the previous frame's timestamp then go to
skb_complete_tx_timestamp() for the new skb?

If the stale TX_TS came from a different type, the 1 ms RDY poll can run
out before the tracked frame is sent, and the skb is dropped. Once that
frame goes out it sets INSR and RDY again. The next frame of that type
would then read a timestamp from one sync interval earlier.

[ ... ]

> +static void rtl8127a_ptp_rx_tstamp(struct rtl8127a_ptp *ptp,
> +				   struct sk_buff *skb)
> +{
> +	u8 msgtype = RTL8127A_PTP_SKB_CB(skb)->msgtype;
> +	struct timespec64 ts;
> +	int ret;
> +
> +	mutex_lock(&ptp->lock);
> +	ret = rtl8127a_ptp_trx_ts_cmd(ptp, RTL8127A_PTP_TRX_TS_SEL_RX |
> +					   FIELD_PREP(RTL8127A_PTP_TRX_TS_MSGTYPE,
> +						      msgtype) |
> +					   RTL8127A_PTP_TRX_TS_EXEC);
> +	if (!ret)
> +		ret = rtl8127a_ptp_read_time(ptp, RTL8127A_PTP_TRX_TS_TIME,
> +					     &ts);
> +	mutex_unlock(&ptp->lock);
> +
> +	if (!ret)
> +		skb_hwtstamps(skb)->hwtstamp = timespec64_to_ktime(ts);

[Severity: Medium]
Can this report another frame's timestamp as a valid hardware timestamp?

The PHY latched this value when the frame hit the wire. The frame then
went through the MAC, NAPI, rtl8127a_ptp_rxtstamp() and rx_queue before
this read. Any later event message of the same type in that window
overwrites the latch, and this skb gets the later frame's time. Examples
are a Delay_Req from a second client, a Sync from another master, or any
PTPv2 frame sent to UDP port 319.

When two skbs with the same msgtype are in rx_queue together, the first
one always gets the second one's timestamp, and both end up with the
same value.

There also doesn't seem to be a freshness check.
rtl8127a_ptp_hwtstamp_enable() unmasks the RX status:

    ret = rtl8127a_ptp_modify(ptp, RTL8127A_PTP_INER, 0,
                              RTL8127A_PTP_INT_RX_TS |
                              RTL8127A_PTP_INT_TX_TS);

but nothing reads or acknowledges INSR RX_TS to confirm that a capture
happened.

rtl8127a_ptp_rxtstamp() also accepts every non-L2 PTPv2 class, including
IPv6 and VLAN tagged frames. Does the mode programmed in
rtl8127a_ptp_hwtstamp_enable() (RTL8127A_PTP_CTL_TYPE_3 | BIT(12))
timestamp those? If not, those skbs would get a stale or reset latch
value.

The commit message says:

    and an RX timestamp may be overwritten by a later message of the
    same type before it has been read.

It doesn't say that the overwritten value is still delivered as a valid
timestamp.

The v3 notes also list "Document the per message type limitation". There
doesn't appear to be a matching code comment, and the new Kconfig help
text has no caveat:

    and timestamps PTPv2 event messages over UDP on behalf of the
    MAC, so no support from the MAC driver is needed.

[ ... ]

> @@ -331,8 +517,172 @@ static const struct ptp_clock_info rtl8127a_ptp_info = {

[ ... ]

> +static void rtl8127a_ptp_txtstamp(struct mii_timestamper *mii_ts,
> +				  struct sk_buff *skb, int type)
> +{
> +	struct rtl8127a_ptp *ptp = container_of(mii_ts, struct rtl8127a_ptp,
> +						mii_ts);
> +	struct ptp_header *hdr;
> +	u8 msgtype;
> +
> +	if (READ_ONCE(ptp->tx_type) != HWTSTAMP_TX_ON ||
> +	    !(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) ||
> +	    (type & PTP_CLASS_VMASK) != PTP_CLASS_V2 ||
> +	    (type & PTP_CLASS_PMASK) == PTP_CLASS_L2)
> +		goto drop;

[ ... ]

> +	/* Only one TX timestamp can be pending at a time */
> +	if (test_and_set_bit_lock(RTL8127A_PTP_TX_IN_PROGRESS, &ptp->state))
> +		goto drop;

[Severity: Medium]
Can a sender other than the PTP daemon hold this single slot?

SOF_TIMESTAMPING_TX_HARDWARE needs no capability, and the classifier only
checks the UDP destination port (319). An unprivileged local user could
keep RTL8127A_PTP_TX_IN_PROGRESS set by repeatedly sending PTPv2
formatted packets to port 319 with TX hardware timestamping requested.
ptp4l's own event messages would then take the drop path and get no TX
timestamp.

If the stack classifies a frame as PTP but the PHY doesn't timestamp it,
the slot stays held for the whole RTL8127A_PTP_TX_TIMEOUT (15 seconds).

Timestamps are also matched to skbs by message type only, both in
rtl8127a_ptp_tx_tstamp()->rtl8127a_ptp_egress_time() and in
rtl8127a_ptp_rx_tstamp(). There is no sequenceId match and no check
against tx_start. So any same-type frame that hits the wire before the
worker reads the latch replaces the value. On TX that can be a plain
UDP/319 packet from a local user. On RX it can be a frame from any L2
host.

Other PHY timestamping drivers such as dp83640, mscc, nxp-c45,
bcm-phy-ptp and lan8814 match on sequenceId. Is there another way on
this hardware to reject a latched value that doesn't belong to the skb?

[ ... ]

> +static int rtl8127a_ptp_hwtstamp_set(struct mii_timestamper *mii_ts,
> +				     struct kernel_hwtstamp_config *config,
> +				     struct netlink_ext_ack *extack)
> +{

[ ... ]

> +	/* The hardware is either on or off, only reprogram it on a change */
> +	if (enable != ptp->hw_enabled) {
> +		/* Stop timestamping before turning the hardware off */
> +		if (!enable) {
> +			WRITE_ONCE(ptp->tx_type, HWTSTAMP_TX_OFF);
> +			WRITE_ONCE(ptp->rx_enabled, false);
> +		}
> +
> +		ret = rtl8127a_ptp_hwtstamp_enable(ptp, enable);
> +		if (ret)
> +			return ret;
> +
> +		ptp->hw_enabled = enable;
> +	}

[Severity: Medium]
What happens to the cached state if rtl8127a_ptp_hwtstamp_enable(ptp,
false) fails here?

tx_type and rx_enabled have already been cleared, and the error return
doesn't restore them. ptp->rx_filter and ptp->hw_enabled keep their old
values.

rtl8127a_ptp_hwtstamp_get() would then report HWTSTAMP_TX_OFF together
with the old rx_filter, for example HWTSTAMP_FILTER_PTP_V2_L4_EVENT.
Meanwhile rtl8127a_ptp_rxtstamp() drops every packet because rx_enabled
is false.

hw_enabled also stays true. A later request for HWTSTAMP_TX_ON with
HWTSTAMP_FILTER_PTP_V2_L4_EVENT then sees enable == hw_enabled and skips
rtl8127a_ptp_hwtstamp_enable(ptp, true).

The hardware may be partly disabled at that point: INER cleared, or
CTL_EN cleared if the failure happened at the PHY_RST_CTL step. TX
requests would hit the 15 second timeout, and RX timestamps would be
invalid until a later config_init() happens to see CTL_EN clear.

rtl8127a_ptp_hwtstamp_enable() does several MDIO read-modify-writes
(SYNCE_CTL, INER, CTL, PHY_RST_CTL), and any of them can fail.

The v3 notes say "Only update the cached config after programming the
hardware". Should tx_type and rx_enabled be restored on this error path?

[ ... ]

> @@ -350,12 +700,24 @@ int rtl8127a_ptp_config_init(struct phy_device *phydev)
>  	if (ret)
>  		return ret;
>  
> -	if (ts.tv_sec >= RTL8127A_PTP_RESET_SEC)
> +	if (ts.tv_sec < RTL8127A_PTP_RESET_SEC) {
> +		ktime_get_real_ts64(&ts);
> +		ret = rtl8127a_ptp_settime(ptp, &ts);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Restore timestamping in case the PTP block was reset */
> +	if (!ptp->hw_enabled)
>  		return 0;

[Severity: Medium]
What serializes this hw_enabled check against
rtl8127a_ptp_hwtstamp_set()?

rtl8127a_ptp_hwtstamp_set() runs under rtnl. It programs the hardware
inside ptp->lock, then stores ptp->hw_enabled outside any lock.

This path reads hw_enabled and CTL and may call
rtl8127a_ptp_hwtstamp_enable(ptp, true). It holds neither rtnl nor
ptp->lock across that decision.

r8169 reaches this function without rtnl on resume:

rtl8169_runtime_resume()
  rtl8169_up()
    rtl8169_init_phy()
      phy_init_hw()
        rtl8127a_ptp_config_init()

The phylib SIOCSHWTSTAMP path also takes no runtime PM reference.

On disable: hwtstamp_set() clears CTL_EN and drops ptp->lock. If
config_init reads hw_enabled before false is stored, it sees EN clear
and re-enables the hardware. The hardware then stays on while software
says off.

On enable: hwtstamp_set() programs the hardware, then the resume path
re-inits the PHY. config_init still reads hw_enabled == false and skips
the restore. The PTP block stays off while tx_type and rx_enabled say
on. Sending the same config again doesn't reprogram it, because it
matches hw_enabled.

>  
> -	ktime_get_real_ts64(&ts);
> +	ret = rtl8127a_ptp_read(ptp, RTL8127A_PTP_CTL);
> +	if (ret < 0)
> +		return ret;
> +	if (!(ret & RTL8127A_PTP_CTL_EN))
> +		return rtl8127a_ptp_hwtstamp_enable(ptp, true);

[Severity: Medium]
Both the enable and disable branches of rtl8127a_ptp_hwtstamp_enable()
end with:

    ret = rtl8127a_ptp_modify(ptp, RTL8127A_PHY_RST_CTL, 0,
                              RTL8127A_PHY_RST);

and the function never waits for the bit to self-clear.

Before this patch it was only called with enable == false, from probe
and remove. Now it also runs:

- from rtl8127a_ptp_hwtstamp_set() on every on/off change, such as each
  ptp4l start or stop
- from here inside phy_init_hw(), right before phylib continues
  configuring the PHY

If bit 15 of 0xa640 really is a PHY or datapath reset, as the name
suggests, does toggling timestamping drop and retrain the link behind
phylib's back?

Could the next MDIO accesses, from phylib's config_aneg/read_status or
from the aux worker, land while the reset is still in progress? For
comparison, genphy_soft_reset() waits for BMCR_RESET to clear.

The tree doesn't document what this bit does, so it may turn out to be a
harmless strobe.

[ ... ]

> @@ -395,7 +768,15 @@ void rtl8127a_ptp_remove(struct phy_device *phydev)
>  	if (!ptp)
>  		return;
>  
> +	phydev->mii_ts = NULL;
> +	phydev->default_timestamp = false;
> +
>  	rtl8127a_ptp_hwtstamp_enable(ptp, false);
> +	/* Also stops the aux worker */
>  	ptp_clock_unregister(ptp->clock);
> +
> +	if (ptp->tx_skb)
> +		rtl8127a_ptp_tx_complete(ptp, NULL);
> +	skb_queue_purge(&ptp->rx_queue);
>  	phydev->priv = NULL;
>  }

[Severity: High]
Can rtl8127a_ptp_rxtstamp() or rtl8127a_ptp_txtstamp() still be running
on another CPU when this teardown frees what they use?

skb_defer_rx_timestamp() and skb_clone_tx_timestamp() drop
rcu_read_lock() before they read phydev->mii_ts and call the callbacks.
There is no synchronize_net() between clearing mii_ts here and
ptp_clock_unregister() destroying the aux kworker.

A NAPI or xmit context already inside the callbacks could run this
after the skb_queue_purge():

    skb_queue_tail(&ptp->rx_queue, skb);
    ptp_schedule_worker(ptp->clock, 0);

or this after the tx_skb check:

    smp_store_release(&ptp->tx_skb, skb);
    ptp_schedule_worker(ptp->clock, 0);

Wouldn't that leak the skb and the socket reference taken by
skb_clone_sk()? It would also schedule work on a destroyed clock and
later touch ptp after devm has freed it.

There is also a case that doesn't need a race. phy_remove() calls
drv->remove() without phy_detach(), so root can unbind the PHY driver
through sysfs while the netdev is up.

If this PHY was selected as the hwtstamp provider through tsconfig,
dev->hwprov is only cleared in phy_detach(). The next PTP packet then
takes the hwprov branch of skb_defer_rx_timestamp():

net/core/timestamping.c:skb_defer_rx_timestamp() {
    ...
	mii_ts = phydev->mii_ts;
	if (likely(mii_ts->rxtstamp))
		return mii_ts->rxtstamp(mii_ts, skb, type);
    ...
}

Does that dereference the now NULL mii_ts in softirq context?

Before this patch the PHY had no mii_timestamper, so this patch
introduces the problem.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117060120.1175-1-javen_xu%40realsil.com.cn
