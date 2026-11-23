Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425088;
	b=2O+Beh6FreEBgFs8ppumeQcMozowIlceIwh77FceRhJrId763OMt9oW5xqMdaEpnRbVZ
	 pzhP2DEZluSX2DOdM10AKKKq4qvMoiaArPbcyYctNk9g6Y2QEbQ6SR6yDx+5OEbcJLwBD
	 vw0//sa7vVD5fhJ8w8hj1hGB+hQlzI6sO/JjuHbggpg9RYRdM5v+vSCcPhcdYo2tB4IBr
	 5fuwH/i7phDkZErInoP9BmQV1dzNGl2r9Srq4go8HmhFEDUmdmEQhWkRKq1sS8KIpzC83
	 fewC2Jb08RK/0OVePr9E66Jj+yxxxzFn8WdJ1paj6ruvsLn92MzHNl2SILAgs82BzWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425088;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=iYJgAay7RVeU1p2WQGlauEXq3p+UlBiEl4Cgoy9ZUvU=;
	b=JbWO7psLg7gGf1z+9Knfyek9LtZtSrQJN6LIbNv47933ddnTQbpzJNdYm/fmIaQXfbZm
	 DBCttIff49PfB9aYi+JX630YWWGOgFxqAbaHrPXNEt9LUgLB6Ttgd6XwJVd0CMbXom6C4
	 E3BYXSVR24yuDDO4d/ROIIZCRmMiE8x0I+TobUIEyEf3THRsM/qZwCAyg7DrWgaF6PC/Z
	 zNUza7JdCcoLIljIcdJPQgDuODaECrqyrZ3EIetX0ZEC+oIB8Py0+ScFaM4wqbciZP7hh
	 Dr41+DAe7Ynw3Ev8H/LUpyaMRWT8nnDiWwEUGnE8/a1mCnxUeqrCHU67Ivw1gnAATxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=cVC5Qx3H;
	arc=none smtp.remote-ip=117.135.210.8
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF513606A32D;
	Mon, 23 Nov 2026 09:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF513606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=cVC5Qx3H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=iY
	JgAay7RVeU1p2WQGlauEXq3p+UlBiEl4Cgoy9ZUvU=; b=cVC5Qx3HBEovcCeJGN
	cEjwlAGbGRoaXUpZOhOZc/jGa5lhAvYLUwtPSLVnMu0OtLxyrATN3mVgjLwI/fRq
	Gogork+gRl4D74RNJmdgI+8Mu4YGMhQndDooyjY1qICIUxDiUFs8yIdE9EdunffG
	7OpHbVhvUVmjTjns6+v6+jkM8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3xwf3AgRr4lagDg--.32715S2;
	Mon, 23 Nov 2026 17:10:16 +0800 (CST)
From: Linkui Xiao <xiaolinkui@126.com>
To: andrew@lunn.ch
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
Date: Mon, 23 Nov 2026 17:10:12 +0800
Message-Id: <20261123091012.730441-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ef2eb733-4b94-4c2e-9165-0b324733a482@lunn.ch>
References: <20261112075321.3903875-1-xiaolinkui@126.com> <ef2eb733-4b94-4c2e-9165-0b324733a482@lunn.ch>
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
X-CM-TRANSID:_____wD3xwf3AgRr4lagDg--.32715S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWkZryUJF1rGFWrZFyUGFg_yoW8tF15pa
	93twnakr1kGF1fuFsrZFyUCryjkFZ7Ga45t34F9rW5Za4DWr1ayrW7Kw1UZa4YkF95Ga4j
	vFWjga9xJF4Dtw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUza09UUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqRiacWsEAvgl8AAA3a

Hi Andrew,

Thanks for the review, and for pointing out the missing teardown.

> This commit message is overly verbose and contains a lot of irrelevant
> information.

Agreed. v2 1/2 is three paragraphs: what breaks, why of_phy_connect(), and
why the new phy_disconnect() calls belong in the same change. I dropped the
walk through phy_prepare_data(), the list of other drivers, the archaeology
about 08e39982ef64, and the "no in-tree DTS does this" paragraph. The cover
letter notes the AI assistance per
Documentation/process/generated-content.rst.

> Why is emacs_adjust_link() still called?

of_phy_connect() only stores the handler in phydev->adjust_link, attach
never calls it. The state machine is not started on this path either -
emac_mdio_init_phy() runs only for the phy-handle case - so nothing else
fills in dev->phy, which emac_configure() reads to build MR1. A fixed link
cannot change, so calling it once is enough.

Answering that turned up a second bug. Since d99b408ed8e5 ("net: phy:
fixed_phy: remove not needed initialization of phy_device members") the
phy_device no longer carries the DT status, so that call currently copies
SPEED_UNKNOWN and DUPLEX_UNKNOWN and the MAC is programmed for 10 Mbit/s
half duplex. That is 2/2 of v2, which adds a phy_read_status() after the
attach. emac_mdio_read_link() already does exactly that for the phy-handle
path.

> This last sentence about phy_disconnect() was one of the things i thought
> about while looking at the change, but because the commit messages was so
> long, i had given up reading it....

Fair, and leaving it out was the wrong call: this patch is what creates the
attached state, so it should also tear it down. v2 calls phy_disconnect() in
emac_remove() and at err_detach_tah, and of_phy_deregister_fixed_link() in
both places, plus the connect failure branch. That also fixes the
phy-handle path, which called phy_start() without ever calling phy_stop().
emac_remove() unregisters the netdev first, so detaching without RTNL is
fine.

v2 is posted as a new thread: [PATCH net v2 0/2].

Cross compiled for powerpc with W=1 out of ppc44x_defconfig, clean. No
hardware here, so no runtime test.

Thanks,
Linkui

