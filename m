Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459601;
	b=ZBh/yRys25KO/lmAf7xtbII84TiuHXCzfu1/fDi1szh2P4wCafcaZh7b1LIpK8L+0wRK
	 Wer6AOw+sw+iy9ZHIblfLi1NWq1CeOFW74g0IGpinIeG4v27dl1FLRNnEhXl2BCjvjydD
	 u0TvHB6MgolQ+v++QksbrrGIpJW3cNC9H87HTCmNVNRaYpVYfVvPrfiigRJPxpQAhbGt3
	 0q8a1IzgGZmv12xBSfsJs3lnSzRS9UtE1EayglrV7bHBGgKLDVoBPT8+YLfX7dk5D4Ygk
	 d8314fhb+6BvqMIWc+Hhv5rhE4ZuGXkskxUO2ZKDI2vuVbncN3FGXvwufrCOl7I2YiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459601;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZTChiiMixcnFB5cRYtJQaT2zLxpnBgFNM/9oYFt3zJE=;
	b=pPB1KtTsSz8RuSM+y6UpnLCJuMpAgIMZfrSXcspj8pPU/nBh282PDDyKmFqbi4BWnkU8
	 pQ9HsyZXXmQWfeeDZ5DJdC2au081sxP330e4JG0zIWHFFCTw5HtdKmz0gXE+diXh0vsrm
	 X9RXzRWIzslpUFnXgt4G9W5jTbJO5dgCBosLxXMSvAaMDhoHYd46ukCIN5Uypv8kSW6c4
	 yPAMHEJxmGjj8hofNha3hlzjKq95tMp4iQsCN5E3nIjrfiac2Yk0oHatBLedyLww0unBx
	 /BQMNCuqYFEhwIpuYpZw1p33suV9S575jWdrb0Sz4v1jVxKnAlI0Pake1R5d87Yds9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNDh8SOf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70636606A330
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNDh8SOf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9232B1F000C0;
	Mon, 23 Nov 2026 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459601;
	bh=ZTChiiMixcnFB5cRYtJQaT2zLxpnBgFNM/9oYFt3zJE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hNDh8SOfIIBWsqAa+3HewBTVfOAHzzrD1KZDBqcZ55P5x1lEYAbKnOKdDD5TPUPv0
	 fdkdzQ6a3iecudlNtCqktOe986+vikn7uU/TfbwnrY7fkKH6BT3hQxZ9j05HAu1hOU
	 6RD0YEmYa8rY78mzKJqu9z+jUYkUL0EEZSo3jNwWCYZWaMeoumTxZJ5kBX+5Jfrk6b
	 WWQheIjCB9HTais7c1YG5gRfwKmeIxpgUkLtCobq8PwF7Fs6rukPhh1eslYGiUVhm/
	 6fAOr4OXNAPR7+Pk/hsYyK55zRreTxfeUE83fh900wKa+E79DU9fp4KZX/vrEjkAyo
	 wLnM5MvnBYeig==
Subject: Re: [PATCH v5 net-next 09/13] selftests: xsk: prepare xskxceiver for
 endpoints on two hosts
From: netdev-bot+sashiko@kernel.org
To: maciej.fijalkowski@intel.com
Cc: netdev@vger.kernel.org, magnus.karlsson@intel.com, stfomichev@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, tushar.vyavahare@intel.com,
 kerneljasonxing@gmail.com, bjorn@kernel.org
Date: Mon, 23 Nov 2026 18:46:40 +0000
Message-ID: <179545960018.3135.10988887966916268523@kernel.org>
In-Reply-To: <20261119164636.1071385-10-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-10-maciej.fijalkowski@intel.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In SKB mode, the remote's driver-mode RX_SG flag still gates
  the multi-buffer cases, so the DUT can lose that coverage.
- [Medium] xsk_wait_link_up() (tools/testing/selftests/net/lib/xsk/xsk.c)
  is meant to wait out a NIC reset, but it stops on the first…
- [Medium] detect_mode_caps() (xskxceiver.c) now sets
  XSK_CAP_DRV|XSK_CAP_ZC from NETDEV_XDP_ACT_XSK_ZEROCOPY alone,…
- [Medium] The new MTU restore in cleanup_iface() (xskxceiver.c) runs
  right after the XDP detach.
- [Low] selftests: xsk: TX-only guard bypassed in xsk_attach_xdp_progs()

--

selftests: xsk: prepare xskxceiver for endpoints on two hosts

This commit adds --queue, --max-frags and --timeout options to xskxceiver.
It also adds a SKIP message on the control channel and a link-up wait after
READY, so a zero-copy endpoint on a DUT can run against an SKB-mode endpoint
on a remote host. Zero-copy support is now taken from
NETDEV_XDP_ACT_XSK_ZEROCOPY instead of a probe bind, cases default to a 1500
MTU, and cleanup_iface() restores the original MTU.

> diff --git a/tools/testing/selftests/net/lib/xsk/xsk.c b/tools/testing/selftests/net/lib/xsk/xsk.c
> index 54e6808e3fe46..6249a4955b64b 100644
> --- a/tools/testing/selftests/net/lib/xsk/xsk.c
> +++ b/tools/testing/selftests/net/lib/xsk/xsk.c
> @@ -828,3 +828,37 @@ int xsk_get_mac(const char *ifname, u8 mac[ETH_ALEN])

[ ... ]

> +int xsk_wait_link_up(const char *ifname, int timeout_ms)
> +{
> +	struct ethtool_value edata = { .cmd = ETHTOOL_GLINK };
> +	struct ifreq ifr = { .ifr_data = (void *)&edata };
> +	int err;
> +
> +	for (;;) {
> +		err = xsk_ifreq_ioctl(ifname, SIOCETHTOOL, &ifr);
> +		if (err == -EOPNOTSUPP)
> +			return 0;
> +		if (err || edata.data)
> +			return err;

[Severity: Medium]
Should transient ioctl errors be retried here the same way as a down link?
Any SIOCETHTOOL error other than -EOPNOTSUPP ends the wait right away.

__dev_ethtool() returns -ENODEV while the device is detached:

net/ethtool/ioctl.c:__dev_ethtool() {
    ...
	if (!netif_device_present(dev)) {
		rc = -ENODEV;
		goto out;
	}
    ...
}

An error from ethtool_ops->begin() ends the wait the same way.

Drivers detach the netdev during a reset. For example, ice_prepare_for_reset()
and idpf_detach_and_close() both call netif_device_detach(). The local device
may still be detached when sync_endpoints()->wait_link_up() runs. In that
case, wouldn't wait_link_up() print "Link on %s is not up", send
XSK_PEER_ABORT, and fail the case on both endpoints?

That looks like the reset this wait was added for. Could the loop sleep and
retry on such errors until timeout_ms runs out?

> +		if (timeout_ms <= 0)
> +			return -ETIMEDOUT;
> +		usleep(100 * 1000);
> +		timeout_ms -= 100;
> +	}
> +}

[ ... ]

> diff --git a/tools/testing/selftests/net/lib/xsk/xskxceiver.c b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
> index ef03bf3bd37b1..cc7754f3a8224 100644
> --- a/tools/testing/selftests/net/lib/xsk/xskxceiver.c
> +++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.c

[ ... ]

> @@ -403,12 +397,14 @@ static bool is_xdp_supported(int ifindex)
>  	return true;
>  }
>  
> +/* Probe only the mode that the endpoint runs in. */
>  static u32 detect_mode_caps(struct ifobject *ifobj)
>  {
> -	if (is_xdp_supported(ifobj->ifindex)) {
> +	if (opt_mode == TEST_MODE_ZC && ifobj_has_cap(ifobj, XSK_CAP_ZC_ADVERTISED)) {
> +		/* Trust the advertised flag; an XDP_ZEROCOPY bind never falls back to copy. */
> +		ifobj_set_cap(ifobj, XSK_CAP_DRV | XSK_CAP_ZC);
> +	} else if (opt_mode == TEST_MODE_DRV && is_xdp_supported(ifobj->ifindex)) {
>  		ifobj_set_cap(ifobj, XSK_CAP_DRV);
> -		if (ifobj_zc_avail(ifobj))
> -			ifobj_set_cap(ifobj, XSK_CAP_ZC);
>  	}

[Severity: Medium]
On devices where zero-copy support depends on configuration, does trusting
NETDEV_XDP_ACT_XSK_ZEROCOPY alone turn a SKIP into a FAIL?

virtio_net sets the flag unconditionally in virtnet_probe():

	dev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
		NETDEV_XDP_ACT_XSK_ZEROCOPY;

But virtnet_xsk_pool_enable() refuses the pool when the virtqueue has no DMA
device:

	dma_dev = virtqueue_dma_dev(rq->vq);
	if (!dma_dev)
		return -EINVAL;

That happens without VIRTIO_F_ACCESS_PLATFORM, e.g. a default QEMU
virtio-net-pci without iommu_platform=on. It also returns -ENOENT when the RX
queue has no page_pool (big-packets mode).

With the old ifobj_zc_avail() probe bind, such a device skipped every
zero-copy case. Now mode_supported() passes, but the XDP_ZEROCOPY bind fails
in each case, so the case is reported as FAIL.

The commit message says "a false advertisement still fails the case". The
static flag cannot tell whether a given device instance can do zero-copy,
though. Is failing every ZC case on such setups, for example virtio-net CI
VMs, the intended result?

> @@ -423,8 +419,10 @@ static bool mode_supported(enum test_mode mode, u32 caps)
>  	return caps & XSK_CAP_ZC;
>  }
>  
> -static void cleanup_iface(struct ifobject *ifobj)
> +static int cleanup_iface(struct ifobject *ifobj)
>  {
> +	int err = 0;
> +
>  	/* A peer shadow has a skeleton but no bound interface. */
>  	if (!ifobj_is_local(ifobj))
>  		goto unload;
> @@ -432,8 +430,16 @@ static void cleanup_iface(struct ifobject *ifobj)
>  	if (ifobj->xdp_prog)
>  		xsk_detach_xdp_program(ifobj->ifindex,
>  				       mode_to_xdp_flags(ifobj->mode));
> +	/* After the detach, as an attached program can cap the MTU. */
> +	if (ifobj->dev_mtu != ifobj->orig_mtu) {
> +		err = xsk_set_mtu(ifobj->ifindex, ifobj->orig_mtu);
> +		if (err)
> +			ksft_print_msg("Failed to restore MTU %d on %s\n",
> +				       ifobj->orig_mtu, ifobj->ifname);
> +	}

[Severity: Low]
Does POLL_TXQ_FULL still attach an XDP program on a TX-only endpoint
in SKB and DRV mode?

testapp_poll_txq_tmout() runs single-threaded on the TX ifobj:

testapp_poll_txq_tmout()
  testapp_validate_traffic_single_thread(test, test->ifobj_tx)
    __testapp_validate_traffic(test, test->ifobj_tx, NULL)
      xsk_attach_xdp_progs(test, test->ifobj_tx, NULL)

The TX ifobj therefore enters xsk_attach_xdp_progs() as ifobj_rx. On
the TX host that ifobj is local. xdp_prog_changed_rx() looks at
test->ifobj_rx, which is the shadow there and never has a program, so
it is true.

xsk_reattach_xdp() then attaches test->xdp_prog_rx and test->xskmap_rx
to the TX interface. Those come from the shadow's skeleton. The
function returns at the !ifobj_tx check, before it reaches the new
rx_on / TEST_MODE_ZC guard.

The commit message says an endpoint that only transmits attaches the
XDP program only in zero-copy mode. This case does not follow that
rule. In DRV mode it attaches a native program on the TX NIC, which is
the kind of change that can reset a NIC and that this patch otherwise
tries to avoid.

Should the TX-only check be based on rx_on of whichever ifobj is being
attached, so that it also covers the first branch? Or should the
single-threaded path pass its ifobj in the slot that matches its
role?

[Severity: Medium]
Can this restore race with the deferred release of the zero-copy pool?

Closing the XSK socket does not unbind the pool from the queue right away:

xsk_destruct()
  xp_put_pool()
    queue_work(system_freezable_wq, &pool->work)

xp_release_deferred()   (later, under rtnl)
  xp_clear_dev()
    ndo_bpf(XDP_SETUP_XSK_POOL, NULL)

Nothing makes this MTU request wait for that work. mlx5e_change_mtu() rejects
an MTU that does not fit a pool that is still bound:

	if (priv->xsk.refcnt &&
	    !mlx5e_xsk_validate_mtu(netdev, &priv->channels,
				    &new_params, priv->mdev)) {
		err = -EINVAL;

For example, take a DUT with an original MTU of 9000 that runs a default ZC
case at 1500 with 4096 byte chunks. If the restore to 9000 gets rtnl before
the pool teardown, it fails. The endpoint then reports FAIL for a case that
passed.

Under xsk.py the fallback ip link set mtu restores the MTU later. Run
standalone, xskxceiver leaves the NIC at the test MTU.

The series already retries ethtool -G in xsk.py's _set_ring() for the same
deferred release ("A driver can refuse that while an XSK socket that just
closed still holds a queue, as ice does until a work item releases the
buffer pool"). Should the MTU restore get a similar retry?

>  unload:
>  	xsk_unload_xdp_programs(ifobj);
> +	return err;
>  }

[ ... ]

> @@ -553,8 +563,17 @@ int main(int argc, char **argv)
>  
>  out:
>  	xsk_set_endpoint(NULL);
> -	cleanup_iface(ifobj_tx);
> -	cleanup_iface(ifobj_rx);
> +	err = cleanup_iface(ifobj_tx);
> +	err |= cleanup_iface(ifobj_rx);
> +	/* xsk.py trusts a passed or skipped endpoint to have undone the MTU. */
> +	if (err)
> +		ret = TEST_FAILURE;
> +	/* After the cleanup, which can still fail a case that ran. */
> +	if (test.test_func)
> +		report_pkt_test(&test, ret);
> +	/* The peer skips the case too, rather than fail on the closed connection. */
> +	if (ret == TEST_SKIP)
> +		xsk_peer_skip(peer, opt_timeout * 1000);

[Severity: Medium]
Can this SKIP pass on to the DUT a skip that comes only from the remote NIC's
native driver features?

In SKB mode, __testapp_validate_traffic() requires XSK_CAP_MBUF on both
ifobjs for every case with test->mtu > MAX_ETH_PKT_SIZE:

	mbuf_cap = test->mode == TEST_MODE_ZC ? XSK_CAP_MBUF_ZC :
						XSK_CAP_MBUF;
	...
		return TEST_SKIP;

detect_ifobj_caps() sets XSK_CAP_MBUF only from NETDEV_XDP_ACT_RX_SG. That
flag belongs to the native driver's feature set:

	if (query_opts.feature_flags & NETDEV_XDP_ACT_RX_SG)
		ifobj_set_cap(ifobj, XSK_CAP_MBUF);

An SKB-mode endpoint binds with XDP_COPY, and xp_assign_dev() returns early
for force_copy without looking at xdp_features. Generic XDP handles frags for
an xdp.frags program through
netif_skb_check_for_xdp()->skb_cow_data_for_xdp().

setup_peer() copies the remote's own caps into the shadow, so both checks
read the remote NIC's RX_SG bit.

If the remote NIC does not advertise RX_SG, the remote returns TEST_SKIP for
every multi-buffer case: SEND_RECEIVE_9K_PACKETS, the *_MULTI_BUFF cases,
TOO_MANY_FRAGS, UNALIGNED_*_9K/MB, and others. With this patch it then sends
XSK_PEER_SKIP. The ZC DUT's sync_endpoints() returns TEST_SKIP, and xsk.py
reports the case as skipped.

Doesn't that lose the DUT's multi-buffer zero-copy coverage just because of
the remote's native XDP flags? It also seems to go against "an endpoint
probes only the mode it runs in" in the commit message.

>  	xsk_peer_close(peer);
>  	pkt_stream_delete(test.tx_pkt_stream_default);
>  	pkt_stream_delete(test.rx_pkt_stream_default);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119164636.1071385-1-maciej.fijalkowski%40intel.com
