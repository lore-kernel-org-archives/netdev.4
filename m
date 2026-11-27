Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744129;
	b=bd6ynzj299AWZGiZJTM6Md1m2AWwPpc0eLp0IBYffNIfrY6pK3wph1ulIVp/GE1RWkws
	 MG7GgUKWcOMw5vohOgYTqxUwSRipN2JRzclobq11uUu1ODEmld5Kh1v2+QQQqPihrVC2+
	 obCssgv1iTXlvjoPCxn6uER5DUsSlB0PtoOhddO5YVY5nF/hQfZ4qu9H3Eix82xJSKhId
	 noaGM2gQsX+H8Bi70lPBU/EKDHcGXrEmg0iyq1jLAPQToO8c0olqJ7ikJUtnNbEVSMlI8
	 KAVP1MWoDv9+ZecfAGG01j0nF8LXgPZQ6GXdhaMyH8GP0YYII0btfwvHjpwa3q/DSsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744129;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=F9bJgw3Rq+nxWnesx6NpE3jyyip8FQiNM7chh1BiCko=;
	b=bl2LZq1F+ubM20aVhHMl7ujgGvRphkAdOiJDNbZw7S0e6c6tADtOxF8F82XQGMbBo0QJ
	 HY9iA8xoljW9YjH3O8ZQgO2H3FKq+ghwR1sbaViyoBwHIUWehncKEnuVtn6YBu3VbuEGg
	 iFBnsGFDJwifAEK50IeZiK4uk1cs6tbrC60XsGlmPBoOVyDulBIEeh6Na44nibZGsrsEx
	 2+jIwYKtxzEp/U92SMzA7cES+DhvZjQIlOTHy1sAg0uDr+MFhlVbIj8a2tbFfkpP4z75N
	 +WqvGeRmKm/oIdmFwGzpxxiKpiT72ppFyDS0uW/WRK/0RBYGfdoSUqElLroopV+ImVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=PhiHP0nG;
	arc=none smtp.remote-ip=117.135.210.6
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293CF606A31C;
	Fri, 27 Nov 2026 01:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 293CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=PhiHP0nG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=F9
	bJgw3Rq+nxWnesx6NpE3jyyip8FQiNM7chh1BiCko=; b=PhiHP0nGKC2c1MLuLc
	c74gOAk6ZcSzAGB/5gYpcjBizGFjvxHEZsB7yi4GGVL4sobaWl5MhhK+M8/a4xCE
	GwtXwiJX+QWC+rO6oSKZujwL/I+LuU1pGVSQgZ8/mcqF4MW1/uSuF4/Yq90QcnYC
	phokEaNyokAz0fOaZdailA7Lc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3F6dS4QhrP9d9EA--.22888S2;
	Fri, 27 Nov 2026 09:48:02 +0800 (CST)
From: Linkui Xiao <xiaolinkui@126.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch,
	netdev@vger.kernel.org,
	andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	rosenp@gmail.com,
	chunkeey@gmail.com,
	jacob.e.keller@intel.com,
	kees+treewide@kernel.org,
	daniel.machon@microchip.com,
	hkallweit1@gmail.com,
	linux-kernel@vger.kernel.org,
	Linkui Xiao <xiaolinkui@kylinos.cn>
Subject: Re: [PATCH net v3] net: ibm: emac: attach and start the fixed-link PHY
Date: Fri, 27 Nov 2026 09:48:00 +0800
Message-Id: <20261127014800.2909048-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <179559730279.3135.7318334257799287238@kernel.org>
References: <20261124083941.2480237-1-xiaolinkui@126.com> <179559730279.3135.7318334257799287238@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3F6dS4QhrP9d9EA--.22888S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gr43Cw13XF1DXFyDCFy7Awb_yoW7ZrWrpa
	yftF98Jr1kGrsaqrsrCF48WFy8ZFs7G345A340krWY9r1Y9ryfZrW7K34Utay5CrZ3X345
	tr40va9rAa90vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRvtCxUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqRJpQGsI4VIPvAAA3x

Thanks for the review. All four are legitimate. v4 is posted as a new
thread; it also starts the fixed PHY through emac_mdio_init_phy(), which is
what Andrew asked for in his review of v3.

- [High] Unbind can leave a freed net_device queued on the linkwatch list.

Correct, including the chain, and the reason is not that the reference is
weak. unregister_netdev() -> netdev_run_todo() drains lweventlist through
linkwatch_sync_dev(), and it is also the only place that waits for the
refcount, in netdev_wait_allrefs_any(); it returns as soon as the count
reaches one. A carrier change after that queues an event nobody will ever
wait for again: linkwatch_add_event() does list_add_tail() + netdev_hold(),
and netdev_hold() is a real __dev_hold(), but free_netdev() does not wait
for refs and never takes dev->link_watch_list back off, it goes straight to
ref_tracker_dir_exit(), free_percpu(dev->pcpu_refcnt) and put_device() ->
netdev_release() -> kvfree(). devres frees the netdev as soon as
emac_remove() returns, and __linkwatch_run_queue() then walks the list,
calling netdev_tracker_free() and __dev_put() on freed memory.

Fixed by stopping the PHY before unregister_netdev():

	if (dev->ndev->phydev)
		phy_stop(dev->ndev->phydev);

phy_stop() is what turns the carrier off, so the event is queued while the
netdev is still registered and unregister_netdev() drains it.
phy_disconnect() stays below it: it only stops the PHY when
phy_is_started(), which is false by then, and moving it up would detach
from a registered netdev without RTNL, which phy_detach_internal() only
tolerates once reg_state != NETREG_REGISTERED.

I did not move phy_start()/phy_stop() into emac_open()/emac_close(). Andrew
asked for the fixed PHY to be started the way this driver starts a real
PHY, and that is emac_mdio_init_phy() from emac_init_phy(), not from
ndo_open. Splitting the two belongs to the phylib/phylink rewrite he also
asked for.

err_detach_tah keeps its order, with one caveat. A failure before
register_netdev() leaves reg_state at NETREG_UNINITIALIZED, where
netif_carrier_off() returns before it reaches linkwatch, so the
phy_disconnect() there cannot queue anything.

The caveat is a failed register_netdev(). It leaves the netdev
NETREG_UNREGISTERED, whether netdev_register_kobject() failed or the
NETDEV_REGISTER veto ran the rollback, so netif_carrier_off() no longer
returns early. If the state machine brought the carrier up between the
probe's own netif_carrier_off() and the failure, the phy_stop() inside
that phy_disconnect() queues one more event: after netdev_run_todo() has
drained the queue on the veto path, with no drain at all on the other.
That takes register_netdev() to fail, so I did not widen the error path
for it.

- [Medium] dev->phy is now filled in asynchronously.

The ordering is real: phy_start() only does phy_queue_state_machine(phydev,
0) and emac_adjust_link() just copies the resolved values into dev->phy, so
emac_open() can win the race and build MR1 from the probe defaults, and
since a fixed link never changes state again the callback will not fire a
second time to correct it.

I left the code alone in v4, but the commit message no longer implies the
speed is settled. It now carries this paragraph:

> phy_start() only queues the state machine, so an emac_open() that wins the
> race against the first emac_adjust_link() still builds MR1 from the probe
> defaults, and a fixed link never changes state again for a second callback
> to correct it. That window is the one the phy-handle path has always had,
> this driver starts its PHY at probe time rather than in ndo_open, and the
> next ifdown/ifup closes it.

Two things bound the window. It is not new: this driver has always started
its PHY from emac_init_phy() at probe time and never from ndo_open, so the
phy-handle path has the same race against its first ifup. And it is not
permanent: emac_open() runs emac_configure() on every open, so an
ifdown/ifup picks up the dev->phy values the callback filled in meanwhile.
What is permanent is the behaviour before this patch, where dev->phy.speed
stays SPEED_UNKNOWN, emac_configure() takes the default case, and the port
is programmed 10 Mbit/s half duplex with flow control off whatever the
fixed-link property says.

Making it deterministic means reading the link under link_lock before
emac_configure(), or reconfiguring from the callback, and the ethtool paths
already take link_lock before calling into phylib. That is the same
rewrite; I would rather do it there than bolt it onto a crash fix.

- [High, pre-existing] NULL mdio_read on the gpcs path.

Also correct. The branch returns before dev->phy.mdio_read, mdio_write and
gpcs_address are assigned, and emac_configure() reaches
emac_mii_reset_gpcs() -> gpcs_phy_read() on every open and reset_work, so a
sgmii/tbi/rtbi port in that branch dereferences NULL. arches.dts EMAC0
(sgmii, phy-map 0xffffffff, gpcs-address 0xa) is exactly that case. It is
untouched by this patch and predates it; I will send a separate fix.

- [Low] name baab9de385a8 in the commit message.

Done. The v4 commit message now says that baab9de385a8 ("net: ibm: emac:
use netdev's phydev directly") dropped

	if (dev->phy_dev)
		phy_disconnect(dev->phy_dev);

from emac_remove() along with dev->phy_dev, and that the emac_remove() hunk
restores it.

Cross compiled for powerpc out of ppc44x_defconfig with W=1, clean. No
hardware here, so no runtime test.

Regards,
Linkui

pw-bot: cr

