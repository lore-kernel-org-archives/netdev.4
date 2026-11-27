Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744135;
	b=qgLeEpRJKi9c3vTuuif9bsR/XC8BPcYoolPdsgXlXZHKyr+nsQ4K/63xh5Lj7UXKpbmL
	 WNZG1kn9BtpNoWzI0wNucKd4qidF3IevkMeMsconis49R6z4noUCzRzAf8PEyOus8DbmG
	 VbF6uzkekAL9u/zrtdATgFVTGXUa2z2FieXylJOkVuo09qjQDH1aSpju0FyE7dy2RWLUE
	 GmrfUBSKYfRUntet3V0a3xf3vsRUF7i/Wv9LDhCxKd8bUJiUCLndzXjA32+bifcI+2fnz
	 1oInWJkZmWjxMfrgPubMUADBj1REDoHzwSCnG78plzrglM2LkOqrZPzKXg8bDfvgG5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744135;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=DL6Wd0k3LmVENF8I84FYQYNe7fPzQAm42JdnEnBjhXI=;
	b=D89g20BLddvhDVqeNKaVa/DyXXu3Ztx8aAX8meq8do0g/1Hh+klL4poBy4DfZmReEVqo
	 vhypndZbhNb2UZ9ZJ2wPx7ZbeC539vxTLj9IGAYYpKglraK3GDGm6126FTX2DlXp/hpQl
	 FYhwlGX6KH+Js1/14p1pwaiQ0R1vDWZnEuEblF1uDtb/Puwn1rMngA+ih3q+9xDEcSA+o
	 9gMV4xsI5QJ39XGf9QY4FifzxldPNFN08/zVr8F9Dl4pDb54K0xkiAOJy81dnrZbz7Mkt
	 Ppht3nYtgRqiAeFaQ4Lq49G8rWmWoZZrXm8VF5p6mzwfd3K7Up1TnNvGxHZxh7tNh0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=cjfBaPx0;
	arc=none smtp.remote-ip=117.135.210.8
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B42606A31E;
	Fri, 27 Nov 2026 01:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94B42606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=cjfBaPx0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=DL
	6Wd0k3LmVENF8I84FYQYNe7fPzQAm42JdnEnBjhXI=; b=cjfBaPx0tb5wOTW2By
	hq/ztHX660Qmzask4aW1sDtnWTqX5NQihuMzM2oNibb4F6Cuctxd/JAWFp1GoRPk
	Z/mvTQ8Q3SVRtDWmgDED7C1FVV9BlD7Gd5h4ePU6Nz/PJTm60sQeRgpTUBRXtE/E
	wBErxZTamFseRTwgwiTD0JvVA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgDnz8ZO4QhrL7O8EA--.45791S2;
	Fri, 27 Nov 2026 09:47:58 +0800 (CST)
From: Linkui Xiao <xiaolinkui@126.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	rosenp@gmail.com,
	jacob.e.keller@intel.com,
	daniel.machon@microchip.com,
	chunkeey@gmail.com,
	kees+treewide@kernel.org,
	hkallweit1@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linkui Xiao <xiaolinkui@kylinos.cn>
Subject: Re: [PATCH net v3] net: ibm: emac: attach and start the fixed-link PHY
Date: Fri, 27 Nov 2026 09:47:56 +0800
Message-Id: <20261127014756.2908959-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <7057d70b-033d-49cd-9fc7-d6b9b39ffc84@lunn.ch>
References: <20261124083941.2480237-1-xiaolinkui@126.com> <7057d70b-033d-49cd-9fc7-d6b9b39ffc84@lunn.ch>
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
X-CM-TRANSID:PykvCgDnz8ZO4QhrL7O8EA--.45791S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyrKry3JF1kZF1ruFyDWrg_yoW8Kryxpa
	yFvF4rtr4kJFWIvF4DCa1UCry8Cwn5Ja4Yya4IkrWYkr98Wr17WrZFy3y7Zay5Crs3WFyr
	ta1Fvas8AFZrZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRm2N_UUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqA5oP2sI4U4KHAAA3r

Hi Andrew,

Thanks for the review.

> There is also a call to phy_start() in emac_mdio_init_phy(). If that
> is how a real PHY is started, a fixed link PHY should be started in
> the same way.

Done in v4:

-			phy_start(ndev->phydev);
+			/* Start it the same way as a real PHY. */
+			res = emac_mdio_init_phy(&dev->phy);
+			if (res)
+				return res;

emac_mdio_init_phy() is the mii_phy_ops .init handler that
emac_init_phy() already calls at the init_phy: label for a real PHY, so
there is one start path again. It also runs phy_init_hw() a second time,
which is what the phy-handle path does today after of_phy_connect().

I did not let the fixed link fall into the init_phy: block itself. After
ops->init that block masks the features and then calls setup_aneg() or
setup_forced(). dev->phy.features for a fixed link has no
SUPPORTED_Autoneg, so it would take setup_forced(), pick a speed out of
dev->phy.def->features instead of out of the fixed-link property, and push
it into the phydev through emac_mdio_phy_start_aneg().

> However, this code is a horrible mix of phylib and mii. It really
> needs a rewrite to make it pure phylib, or ideally phylink.

Agreed. struct mii_phy and its ops duplicate what phylib already does,
emac_open() and emac_link_timer() poll the PHY on top of the state
machine, and emac_ethtool_nway_reset() reaches ops->setup_aneg() for a
link phylib owns.

That is much bigger than this crash fix, and I have no 4xx board here to
test a conversion on, so I kept v4 minimal. I would like to do the
conversion as a separate net-next series and would need someone with the
hardware to test it. Say the word if you would rather not take the
minimal fix first.

v4 also stops the PHY in emac_remove() before unregister_netdev().
phy_stop() turns the carrier off, which queues a linkwatch event, and
unregister_netdev() is what drains that queue, so a carrier change after it
leaves this netdev on the linkwatch list for the linkwatch work to pick up
once devres has freed it. phy_disconnect() stays below unregister_netdev(),
detaching a PHY from a registered netdev wants RTNL and ->remove does not
hold it. Details are in the changelog under the ---.

v4 is posted as a new thread. Cross compiled for powerpc out of
ppc44x_defconfig with W=1, clean. No hardware here, so no runtime test.

Thanks,
Linkui

