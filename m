Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509655;
	b=RkyJNa47jkgo2gfG7wDt2ehOJQu4ncmRh1eiH7txxqZ54npwsx8q46lnopUFqUgnNmEv
	 iQU1wZmkMsa3LrdNW6Q6V4ENaWlvsgX2It84daVmglZbv3DPzbMj/5ceNn+rKOYlStLQt
	 XNBh0F65XUkP4OqjalWsliELPp+g2cglIj9izrJofN+XpP8ooiQ6nyUHnzK+z3UlU8vXj
	 t5HMdMTvK5BpKgUZ2an5BsN9bDxCPFssdXx6F7ozvO/CJ8qzwLQwQoYIndZNcneeKLL5w
	 chDqkhoQIYZdS3nT07q0BtQwBLEdkgUATRQWU1vH5TJXnuMx0BRtTyMD1Jd8o6BDUzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509655;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=LLFwVtKDDdrBbmQl5AzXD5u/y9ekHppzu7EmZ71WArU=;
	b=FgJdTXIAsiiogqlnS1X4lZe3E6jd8rfDtq83b42IQF3Ba96fpLAz0HfNKeMSjtdl5aqZ
	 bm3Z2/InLn25u98ZFg36BsJBjz1VT6ZsUITB9IpNmDCeLqZLkwEujKwCeF8UXCwtkn2mX
	 r5z/jxzjYkt2Mdm8dcg+uuSx/BRbCu4RDY1IaI7FqjQJ1yh2yoEjbklO96uh+S6TGsHxC
	 07QEknZUnxTNkkX5Gwe9O6SQEMS+B+nNhI4DvFlRzFzGoniZuz+V408BZIbH2NF/AtkiW
	 h7BfRV5CCV9fYHAawzNiKjr6mOsiqJSG1Gy0AH9GlmiJHXyH6fAP2fETOs7rLfCHc5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=OwF9OGky;
	arc=none smtp.remote-ip=117.135.210.8
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F05606A69B;
	Tue, 24 Nov 2026 08:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F05606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=OwF9OGky
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=LL
	FwVtKDDdrBbmQl5AzXD5u/y9ekHppzu7EmZ71WArU=; b=OwF9OGkyhkG4KRk9wT
	IqleHjt3Uu/TnTZv1VP45tgekaaMeCZMLO5UwM8BZmrYuSpAaIr+PJtbbnLnQLIl
	TmVXmsK/6J4N3WfrJLDysx0fPrmIj72dhIyw7xZFXEYgIGPoBqlPtb3SHd17MbPN
	yuc9O6r6AJ9L3Ic7KqfvWb13E=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgD3_8VfTQVrT2gGEA--.38055S2;
	Tue, 24 Nov 2026 16:39:59 +0800 (CST)
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
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linkui Xiao <xiaolinkui@kylinos.cn>
Subject: Re: [PATCH net] net: ibm: emac: attach the fixed-link PHY with of_phy_connect()
Date: Tue, 24 Nov 2026 16:39:57 +0800
Message-Id: <20261124083957.2480682-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4ed4f82b-3ff8-467b-9127-bdc29d498ae4@lunn.ch>
References: <20261112075321.3903875-1-xiaolinkui@126.com> <ef2eb733-4b94-4c2e-9165-0b324733a482@lunn.ch> <20261123091012.730441-1-xiaolinkui@126.com> <4ed4f82b-3ff8-467b-9127-bdc29d498ae4@lunn.ch>
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
X-CM-TRANSID:PykvCgD3_8VfTQVrT2gGEA--.38055S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF1rtr47Xw17uF1DurW3Jrb_yoW8Wr4kpF
	W2q3WDWrs5JF4IvFnrC3y8Cr9akF1kJFWjyryrGrW5AF98Gr12qrZrK3y2yFW5C3Z5Gryj
	vw48JasxXa93taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE_Ma3UUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBlR+GXWsFTV9h0gAA3e

Hi Andrew,

Thanks for the review.

> The whole point of fixed-link is that it works like a real PHY. You
> should not special case it other than when creating it and destroying
> it. You should call phy_start/phy_stop. When start is called, phylib
> will call the adjust link callback, same as a real PHY, and setup the
> MAC as needed.

Done. v3 drops both the hand called emac_adjust_link() and v2's
phy_read_status(): the fixed PHY is attached with of_phy_connect() and
started with phy_start(), and phylib resolves the link and calls the
callback. phy_stop() comes from phy_disconnect() in emac_remove() and on
the probe error path. The only special casing left is creating and
destroying the fixed PHY.

phy_start() stays in emac_init_phy() rather than moving to emac_open(),
because that is where this driver already starts the phy-handle PHY
(emac_mdio_init_phy()). Moving only the fixed link to open/close would
special case it again, and moving both paths is a larger change to code I
cannot test here. Say the word and I will send that to net-next
separately.

I was wrong that a fixed link has no reason to run the state machine.
emac_adjust_link() does not program the MAC either, it only copies speed,
duplex and pause into dev->phy, which emac_configure() reads at open.
phy_start() is called from emac_init_phy(), before register_netdev(), so
the state machine is queued before userspace can bring the interface up.

v3 is posted as a new thread.

Cross compiled for powerpc out of ppc44x_defconfig with W=1, clean. No
hardware here, so no runtime test.

Thanks,
Linkui

