Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425723;
	b=i2T/rr5L9LU2WiUfsp0PW4jlHR7PcPgFi2EEXw+sSwJDkYNeY9YCGh8b+ARySV5Y4LEs
	 ILzYrqmM0GSLdGgjS1sO593Wc6xIbKJOZPVu4Iphi0TLqBFgjqaygiGb0iRdr2hkkesSk
	 F5nEP27+AkmWA9Kf9LaXA1llNuvjoug4eMGkyq3lZUWgT+VsqKTKlQxSmJdSlYBP7ffQQ
	 aQMkt05ca3+jdLnT7JZQYBMFcD1eSbkE+5sDwW7HY0NvdCB4dlppTlemWDZz6jWwbKxsx
	 m5dMp/MyFPAZmqjjjqHCE30YKjrtmN0u0/MuqMTMEn15qf+SVli8L8kJLcagzgsqkTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425723;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=eIbFUnpQzf9CL+kQRcEu/bBGQBOvyQr5xT5bgYpH8ro=;
	b=DO6TM29oWYdicw3LOWqbHw3G/7Pm0fCYfMq0lA53HXIYBPwBW2jt1Km5WuVHcLy1Nl7V
	 ZMTDqAeDdXN0vdVY+vwEwStIHZp8KmrJXzCEA8/RvncIGTXYIgsjzyanAim9ipuqqVxkp
	 r/4Kbj9uGcmfy9iXG+qh66CWZC7ZWcejSAq0khtlSy/rRTdVVgpEeLJb7zOBQfF7tekwj
	 G2L8yzZUrBrs45xt6S0BaGt/23x4lhunKu2sjJxiv9fG4jRgEj+S7yGYlrDYVH+k2eZzf
	 h1MbKyUTNuju/3zuTgffa12dcWSvw0j83inPZrG0W82kL7t14sJE06JJvl7S6dc1Urg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=leeu3TLY;
	arc=none smtp.remote-ip=220.197.31.9
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B83606A31F;
	Mon, 23 Nov 2026 09:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3B83606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=leeu3TLY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=eI
	bFUnpQzf9CL+kQRcEu/bBGQBOvyQr5xT5bgYpH8ro=; b=leeu3TLY9zSwD5MLER
	FnyTVmvJmE0OHOHwK/FePtPVKQPzZBx7zW+6UNu61uC5euhBbBiQcYfPN9Jj1ldA
	/mkRildSOTbjQgqYp2U8ymtO+zp7THEC7W4pwJmwj4Q7hKd5ec+W56DKgKO11tnS
	7KvVwjLaucfOOnBbtJ2EVfeGA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgCHrzx4BQRrXxDDDw--.13815S2;
	Mon, 23 Nov 2026 17:20:56 +0800 (CST)
From: Linkui Xiao <xiaolinkui@126.com>
To: netdev-bot+sashiko@kernel.org
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
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xiaolinkui@kylinos.cn,
	Linkui Xiao <xiaolinkui@126.com>
Subject: Re: [PATCH net] net: ibm: emac: attach the fixed-link PHY with of_phy_connect()
Date: Mon, 23 Nov 2026 17:20:53 +0800
Message-Id: <20261123092053.743714-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <179483706662.3136.12689489417547730312@kernel.org>
References: <20261112075321.3903875-1-xiaolinkui@126.com> <179483706662.3136.12689489417547730312@kernel.org>
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
X-CM-TRANSID:PykvCgCHrzx4BQRrXxDDDw--.13815S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw1ftFy3XF4kGFW7Kw4kJFb_yoW5WFy3pa
	9aqFykAryDGFWS9F4DuFy5GryrCr4xJa4jyFyFgr4a93Z8GryfAFWrKa4UtFyYyas7Ja4j
	vF18Gas3AFWDJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUwmiiUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqRg7EmsEBXhEVgAA3Y

Thanks for the review. All three issues are legitimate; v2 is a two patch
series posted as a new thread, [PATCH net v2 0/2].

- [High] The fixed-link PHY is attached but never detached.

Fixed in 1/2. emac_remove() and err_detach_tah in emac_probe() now call
phy_disconnect() and of_phy_deregister_fixed_link(), so the stale
attached_dev, the NUM_FP slot, the of_node reference and the module
references are all released. emac_remove() already unregisters the netdev
before this point, and phy_detach_internal() explicitly allows detaching
without RTNL once dev is unregistered, so the suspend use-after-free on
the stale attached_dev is gone.

The rebind analysis is correct: without the disconnect the second
of_phy_find_device() returns the still-attached PHY and phy_attach_direct()
fails with -EBUSY. Adding phy_disconnect() also stops the PHY, which the
phy-handle path never did - emac_mdio_init_phy() calls phy_start() and
nothing calls phy_stop().

You are also right that "the rest of the driver already treats
dev->phy.address < 0 as no PHY to poll, so nothing else changes" was too
strong, since the attach state does change. That claim is gone from the v2
commit message.

- [Medium] of_phy_connect() failure leaves the fixed PHY registered.

Fixed in 1/2: the failure branch calls of_phy_deregister_fixed_link(np)
before returning. The teardown paths guard the call with
of_phy_is_fixed_link(), which is the pattern ravb, nixge, davinci_emac and
cpsw use; of_phy_deregister_fixed_link() is also a no-op when no fixed PHY
is registered, so reaching it twice is safe.

- [Medium] emac_adjust_link() copies SPEED_UNKNOWN/DUPLEX_UNKNOWN.

This one is worse than "the old code behaved the same way", so thank you
for pushing on it. The regression comes from d99b408ed8e5 ("net: phy:
fixed_phy: remove not needed initialization of phy_device members"), which
stopped copying the device tree status into the phy_device on the
assumption that the state machine fills those members in once the PHY is
started. EMAC never starts it on the fixed-link path, so emac_configure()
builds MR1 without EMAC_MR1_FDE and without EMAC_MR1_MF_1000 /
EMAC_MR1_MF_100, and flow control is left off.

Fixed in 2/2 with phy_read_status() after the attach, which is what
emac_mdio_read_link() already does on the phy-handle path. The fixed PHY
is bound to genphy, so genphy_read_status() resolves speed, duplex and
pause from the BMSR/LPA/STAT1000/ESTATUS registers that swphy_read_reg()
emulates out of the device tree status. phy_read_status() rather than
phy_start() because a fixed link cannot change and there is no reason to
run the state machine for it.

Cross compiled for powerpc with W=1 out of ppc44x_defconfig, clean. No
hardware here, so no runtime test.

Regards,
Linkui

pw-bot: cr

