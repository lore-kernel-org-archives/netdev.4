Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257387;
	b=R1B7g0e2HHDMSaTFS/SsfKwI44FgfRRd/1jHIhTi7miS9TgaCa2HO51hyK1ZK2Mm4/Sp
	 8qO5RLG/3Zpax2G3uvnmhsHsCbMzeQF+1Q/uS5cOOsz4ETcqVcbHMIAiMPORNIAcX637V
	 FOLvhOzNQbq6jB+513SRFzfQl4jY97Ei9Hn0XX3y0zHjfmKQU5tYBWWe4OrOrBXkDyC6Q
	 EElkm9VACRe8VnAuuC/MYH5/D3KqgLTSCS/GMF5oRAex99HQhq0MMXNtGnW+qC0RG4E+v
	 xtXd46WiYHXLGuAWIj+nQQUDS2tIApR4lp4UU3HZTTF9mr2EqbLezIy3MHmn5T1tI1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257387;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=2PnAaJY3xQ06KzTzfLuIgzUmp8vGuLD/Gl6uWYVbERs=;
	b=ow9otuvyl90Bnf9tIsuk0WFhMpnh9PZxnaUWMbS83v8hna/e/7wm4gIjPfSuKklqgZ5T
	 soU46N2gB4el0NIca3Q4E9eupgBMSHiWchQAJ7MXTz4yw9ARwta2HtfVa6ptYcL16oHRy
	 oI2+N4R8bj2LHK4KMjtPtDlSKy77q+tZlhvhpgOU6sTwwyCQeMji9fsrLJUzxcdwcON+M
	 XKqFh0Xg64BXeJexAhGNQsZbLCu3Va8d5qloPyt6STl5wPfigAio2Hsh1OuZcFTuXly0N
	 u6TDY/8GxH1btTVyv5d6ERS/WqVgR6Ga9whiNxKa65MH7SEWnF8MXauH1ffLmMOhGNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=x4CgwkLn;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC74B606A32C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC74B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=x4CgwkLn
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B7F94C62229;
	Sat, 21 Nov 2026 10:36:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8096D603CF;
	Sat, 21 Nov 2026 10:36:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75B9F11BC0F2B;
	Sat, 21 Nov 2026 11:36:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795257382; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=2PnAaJY3xQ06KzTzfLuIgzUmp8vGuLD/Gl6uWYVbERs=;
	b=x4CgwkLnpZhHGfYIl2UpOuphU1Nb+OVN0YgA/jw/iytwSRX7gydU7GYxq2mR1XLUO3ahGX
	disr4B1ZLiRPo8Zhfljt+oEiWiZDcxwgBnc8TfSCBBps3RVkBXhvfSVfqr92Sc40SEwycw
	iWgRi1DPzVkqr4SZ8pm1KmFTp7JpMmupmgS6jngNz9Z41bITp2cq1RzqbQ5ddxU5+e7FDi
	l/MfvkJtoupgDgLgrQLejwyca+wQZflYZQVyEbAl7lOhhiLPKXWgiiuFr9SVt3llnvHDRM
	qJZFzxt3ZImVYNTtSpUJbRpRP4KxlhKhl5yHJkpesyorFchxRN8K9ul1uUmpnQ==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	matttbe@kernel.org,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	thomas.petazzoni@bootlin.com
Subject: [PATCH iwl-next 0/3] igb: Align the flow-control behaviour with ethtool's specs
Date: Sat, 21 Nov 2026 11:36:09 +0100
Message-ID: <20261121103613.166611-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.1
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
X-Last-TLS-Session-Version: TLSv1.3

Hi,

This series makes a few changes in IGB's ethtool flow-control
configuration to align it with the ethtool expectations.

This was found while upgrading the board farm that runs the stmmac netdev
CI tests. I've upgraded the HW and I'm now using a bunch of I350-T4 PCIe
cards (running igb) as peers for my tests. Since then, the flow-control
tests have started failing:

https://netdevci.bootlin.com/stmmac/outputs/920328-bootlin-stmmac-sun7i-a20/test-outputs/18-pause-py/stdout

This shows 2 things. First, the Pause test is weak to the test peer not
behaving as expected, but we can't do much but assume that kselftest
peers can be trusted.

Second, the igb driver doesn't behave as we expect w.r.t pause:

 - It overrides the pause configuration when we toggle link autoneg
 - It doesn't take the FC user intent (rx on/off tx on/off) into account
   when pause aneg in on,
 - It advertises Pause + Asym when we have "rx on tx on", where it
   should be just Pause (it's not an asym config).

This series addresses that in igb. I think e100e and igc have the same
class of issues, but I don't have any HW to test that on.

Also, this behaviour has been in igb for quite a while (2008 it seems
?) and this is a user-visible change so it may just be too late for
these patches to land, I'll let the Intel folks decide on that, anyways
I'll have these 3 patches running locally in the stmmac farm.

Thanks,

Maxime

Maxime Chevallier (3):
  igb: don't change the pause config when changing the link ksettings
  igb: take the user intent into account when pause autoneg is on
  igb: advertise symmetric pause only for full flow control

 drivers/net/ethernet/intel/igb/e1000_phy.c   |  3 ++-
 drivers/net/ethernet/intel/igb/igb_ethtool.c | 21 +++++++++-----------
 2 files changed, 11 insertions(+), 13 deletions(-)

-- 
2.56.1

