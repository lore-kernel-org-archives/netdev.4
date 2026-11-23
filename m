Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426384;
	b=KyoYIAPh4ocRYMjHeUHczWRDs75Ya/N6Bjltj8ElIkHeDUHwWQlvb8LgZ8qD/HxGxL7X
	 zlaWdyn3fO0jjaLFGXKPWvvZZVPgsmsMsyGxfIN9SwL6oKjsMZCjG01AMCDHVKRvbzmhs
	 j9MC/RrPhb7BPQloJE0elH9cWcl+JJULyclsF1T0P4bgXAsAfolzF6i8ugAMbGeDJhGWL
	 Mm61A+W7HdMROYWzjsBLgS9rQIV/ctgD/4PDYHx4q+67BuoIJ8xoHcefcdkxM3eWpo8DI
	 8gnLyMlI2/wL+dEWKxUe+JXCPfoSpcZW+Rgied0NQt6eTyYPXkWUQOH8W0c3dXgT1cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426384;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=06xW9tpMkIb4xf56q97ikdYDFsFWiDpB39ws2pekZss=;
	b=FTwlvB4r3/gsv8tGsJ8+iAFZSpFK3jCapPQDI9dSgFRpDoJTt7PQ19IJO5C7e757cVJE
	 FumhXWsXQqD14mGYRWAcp3aF1+052LR5JEtAzCAVtuiC02LmOpbjd8TeX5DDNbB5Pwa78
	 zLOqiHK5pUpqtjyZ6GNOpsUeF51gLJIweYiLe6qKALUwUwQZL+ZZ4rRYioqk4Il1Bdipj
	 bH/CTKISqK9sdGo5L8MmWoMKcY7k4JYPOW52VrRJ4XHYxojPppqPMYhGMc67E+XnR2UW5
	 S6pa/uZwP/J2RfdN5YS1MUvz/HvzpDBpl0bWs+cW/rNoxrrTCjcgHxJXY+hKJ5yfegw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=UTXvCv06;
	arc=none smtp.remote-ip=117.135.210.9
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B57606A32E;
	Mon, 23 Nov 2026 09:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B57606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=UTXvCv06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=06
	xW9tpMkIb4xf56q97ikdYDFsFWiDpB39ws2pekZss=; b=UTXvCv06+PM7qefyha
	LzUE4AVOs6DG7qkBexqa4gz0qEysm3EBXkyAycLMQs821MoxHZWJJMMtHgsGD0k+
	dfD6ooQMhst2ZMZXKaQAV7pbZrgnSCSHynX3vY2ZVhQwdr2Tc4ur85Vs4VbW/Ryl
	wk+Wujrg3FSnY3c8OPlddYiws=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgD3l7UTCARrlp7DDw--.2488S2;
	Mon, 23 Nov 2026 17:32:04 +0800 (CST)
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
	xiaolinkui@kylinos.cn
Subject: [PATCH net v2 0/2] net: ibm: emac: fix the fixed-link PHY setup
Date: Mon, 23 Nov 2026 17:31:59 +0800
Message-Id: <20261123093201.770552-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:PykvCgD3l7UTCARrlp7DDw--.2488S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw1UGFWkZF1UWF17tw1xuFg_yoW8Ary8pa
	yrJFsayr1kWw4S9Fs3ArW0vryY9a1kJa4UJFyIq3yYqFyUAryIvr4rGrW5ta4jkr97JFyj
	vFZ2ka93uFn8AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UYiiDUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBlBTiuWsECBTLgwAA3g

From: Linkui Xiao <xiaolinkui@kylinos.cn>

EMAC never attaches the fixed-link PHY, so it is missing from the netdev's
PHY link topology and ETHTOOL_MSG_PHY_GET crashes.  Attaching it also
means it has to be detached again, and it exposes a second bug: since
commit d99b408ed8e5 nothing fills in the phy_device status, so the driver
has been programming the MAC as 10 Mbit/s half duplex for every fixed
link.

Both are fixed here, in the order that keeps the series bisectable.

Cross compiled for powerpc out of ppc44x_defconfig with W=1.  No
hardware, so no runtime test.

Note per Documentation/process/generated-content.rst: the changes were
developed with an AI coding assistant; the analysis, build testing and
review are mine.

Linkui Xiao (2):
  net: ibm: emac: attach the fixed-link PHY with of_phy_connect()
  net: ibm: emac: read the fixed-link status before adjusting the link

 drivers/net/ethernet/ibm/emac/core.c | 31 +++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

---
v2:
  - rewrote the commit message by hand and kept it to the reasons for the
    change (Andrew Lunn)
  - explain why emac_adjust_link() is still called by hand (Andrew Lunn)
  - disconnect the PHY in emac_remove() and on probe failure, and
    deregister the fixed PHY when of_phy_connect() fails (Andrew Lunn,
    Sashiko AI review)
  - new 2/2: read the link status so emac_adjust_link() no longer copies
    SPEED_UNKNOWN into dev->phy (Sashiko AI review)
  - rebased: 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to the
    devm_kmalloc_obj() family") changed emac/core.c since v1
v1: https://lore.kernel.org/netdev/20261112075321.3903875-1-xiaolinkui@126.com/
-- 
2.25.1

