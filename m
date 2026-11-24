Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512842;
	b=2k/d75dR4z7d4SNTr9mhVEKO57bzPcRz3Bp/E103knV+9w/OZrJ2iWxurh6qBsZexjkH
	 UKR3NGUQRZhtw1LEdpVf41LLkFH+HEA5G2ExhrSJDMwqYS59ery/UU5OAv8ceDRCKwOPT
	 2p7uA70Rhl9IQCywUrDVS7iE8ArLK+37qTd490rZ1sqXgZq6EiesF2JNDJ28ZluLCAtvP
	 64YBg6L5S78NnMHeFidj5e84HY9NNAnL+XyXoUgeiqSFLeI3EkmjnGfULI1iIPtTY2SWx
	 zfOwf6pyXLmf/VH8dEX5aTS5TdLKMTX0pinco82bK7FF4CgKt5MHo9SL+0R1tBBKvag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512842;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pEHllY3wB79e0b2IJ3VOYybEoWGDEgP+1ZO0Wb52Q2o=;
	b=iHXeOIMNn8THhW1Zm3Sg6oEc7SHHm/+BdTRTnPpdEnwX/Q5ekW7Q9+/TAcKAKOUSW6f1
	 QtMAf38VkFeiV2xr0iSAPXz2FovklNLC01A9kdm3dBuIgkdwu0zSaiHOlHWfkKvflK8SH
	 ZXo434Mxo4Yz18GAASGtNCroKwzrfAyYnU1NT0rZyabCACo3oQw0ogAGLqEICF5lLuoNY
	 2dfCHVY3Ny+D9VK0LvGGh25tdQc6DWXxZPjpbd5zpGWXJrXXFXWcK5D0V4IXzgnt4GnC3
	 HsyIsxMUofDOUiM/h5RCmyLd7EgEyOHi+F9TiCZq2eV3W1bCFGxtbaAOKfmeD+vnGXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QF5ErUir;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52286606A32D;
	Tue, 24 Nov 2026 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QF5ErUir
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45231F000D1;
	Tue, 24 Nov 2026 09:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795512841;
	bh=pEHllY3wB79e0b2IJ3VOYybEoWGDEgP+1ZO0Wb52Q2o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QF5ErUirrDLXM2ZECVOAMBE9ATMMmiu9gNxoAytjuDcBP608bAcq/RmXdcJmYavK/
	 6Jagw8oIjvo0SMWC0G+czqI/s1ALsbaPJISGkwhGjCSdadBXawzgL+jUVTMQXThVVp
	 7r1iILhR0ZrUPD2obfZtiObFRKCXzE1te/1EduuTtr2e00s9zofalp2+fB860Kfl/y
	 ulbCMkP3cCk2idEO2Mk2s6CrmomUDSDt4kaje7aktGNg3lpoBPMAWKroA9xqteCoB1
	 CeSeDrIOB0csr2AayYn72ZDnvzKpqo1E+kjXSk6+4zV2fCIxQFHFoKtlZD/zmx74cS
	 ymBlMU6uTl90A==
Subject: Re: [PATCH net v2 1/2] net: ibm: emac: attach the fixed-link PHY with
 of_phy_connect()
From: netdev-bot+sashiko@kernel.org
To: xiaolinkui@126.com
Cc: andrew@lunn.ch, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, rosenp@gmail.com,
 jacob.e.keller@intel.com, daniel.machon@microchip.com, chunkeey@gmail.com,
 kees+treewide@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, xiaolinkui@kylinos.cn
Date: Tue, 24 Nov 2026 09:34:00 +0000
Message-ID: <179551284032.3135.4209335363407893906@kernel.org>
In-Reply-To: <20261123093201.770552-2-xiaolinkui@126.com>
References: <20261123093201.770552-2-xiaolinkui@126.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] When the driver is unbound, emac_remove() calls phy_disconnect()
  only after unregister_netdev() has finished.

--

net: ibm: emac: attach the fixed-link PHY with of_phy_connect()

For the fixed-link case, this patch stops setting ndev->phydev by hand
in emac_init_phy() and attaches the PHY with of_phy_connect() instead.
It also adds phy_disconnect() and of_phy_deregister_fixed_link() calls
to the emac_probe() error path and to emac_remove(), so the PHY is
detached on unbind.

> diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
> index 1b95b4d5deff5..ba02cf878a124 100644
> --- a/drivers/net/ethernet/ibm/emac/core.c
> +++ b/drivers/net/ethernet/ibm/emac/core.c

[ ... ]

> @@ -3223,6 +3232,11 @@ static void emac_remove(struct platform_device *ofdev)
>  
>  	cancel_work_sync(&dev->reset_work);
>  
> +	if (dev->ndev->phydev)
> +		phy_disconnect(dev->ndev->phydev);

[Severity: High]
Can this phy_disconnect() run against a netdev that is already
unregistered? Earlier in emac_remove() we have:

	unregister_netdev(dev->ndev);

	cancel_work_sync(&dev->reset_work);

On the phy-handle path, emac_mdio_init_phy() calls phy_start() at probe
time. emac_close() only calls netif_carrier_off() and never phy_stop().
So the phylib state machine keeps running while the interface is down,
and phy_link_change() can turn carrier back on.

Suppose carrier is on when the driver is unbound. That happens if the
interface was never opened, or if the link flapped after close. The
sequence is then:

emac_remove()
  unregister_netdev()
    netdev_run_todo()    /* NETREG_UNREGISTERED, waits for refs */
  phy_disconnect()
    phy_stop()
      _phy_state_machine()    /* PHY_HALTED, phydev->link == 1 */
        phy_link_down()
          phy_link_change(false)
            netif_carrier_off()
              linkwatch_fire_event()
                linkwatch_add_event()
                  netdev_hold()

netif_carrier_off() only skips NETREG_UNINITIALIZED:

	if (!test_and_set_bit(__LINK_STATE_NOCARRIER, &dev->state)) {
		if (dev->reg_state == NETREG_UNINITIALIZED)
			return;
		atomic_inc(&dev->carrier_down_count);
		linkwatch_fire_event(dev);
	}

The unregistered netdev therefore lands on lweventlist, and it holds a
reference taken after netdev_run_todo() has already waited for all
references to drop.

When emac_remove() returns, devres frees the netdev that came from
devm_alloc_etherdev(). Later, __linkwatch_run_queue() still uses it:

	dev = list_first_entry(&wrk, struct net_device, link_watch_list);
	list_del_init(&dev->link_watch_list);
	if (!netif_device_present(dev) ||

Wouldn't that be a use-after-free of the net_device? The same thing can
happen if the running state machine reports any link change between
unregister_netdev() and phy_disconnect().

The commit message says:

  This fixes the phy-handle path as well, which calls phy_start() but
  never phy_stop().

Could the PHY be stopped or disconnected before unregister_netdev()
instead? Another option would be to move phy_start() and phy_stop()
into ndo_open and ndo_stop.

> +	if (of_phy_is_fixed_link(ofdev->dev.of_node))
> +		of_phy_deregister_fixed_link(ofdev->dev.of_node);
> +
>  	if (emac_has_feature(dev, EMAC_FTR_HAS_TAH))
>  		tah_detach(dev->tah_dev, dev->tah_port);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123093201.770552-1-xiaolinkui%40126.com
